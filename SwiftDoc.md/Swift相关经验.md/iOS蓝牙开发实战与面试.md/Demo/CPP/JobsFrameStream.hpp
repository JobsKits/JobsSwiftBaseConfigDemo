//
//  JobsFrameStream.hpp
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

#ifndef JOBS_FRAME_STREAM_HPP
#define JOBS_FRAME_STREAM_HPP
#include "JobsBLECodec.h"
#include <array>
#include <cstddef>
#include <cstdint>
#include <stdexcept>
#include <vector>

namespace jobs {
struct Frame {
    std::uint8_t opcode;
    std::uint16_t sequence;
    std::vector<std::uint8_t> payload;
};

// 单会话、单线程；只用于双方约定的字节流协议，不假设 GATT 本身是 TCP。
class FrameStream {
public:
    void reset() noexcept { used_ = 0; }
    std::size_t buffered() const noexcept { return used_; }

    template <class Sink>
    void feed(const std::uint8_t *bytes, std::size_t length, Sink sink) {
        if (!bytes && length) throw std::invalid_argument("null input");
        for (std::size_t i = 0; i < length; ++i) {
            if (used_ == buffer_.size()) discard_one();
            buffer_[used_++] = bytes[i];
            drain(sink);
        }
    }

private:
    std::array<std::uint8_t, JOBS_MAX_PAYLOAD + JOBS_FRAME_OVERHEAD> buffer_{};
    std::size_t used_ = 0;

    void discard_one() noexcept {
        for (std::size_t i = 1; i < used_; ++i) buffer_[i - 1] = buffer_[i];
        if (used_) --used_;
    }

    template <class Sink>
    void drain(Sink &sink) {
        while (used_) {
            if (buffer_[0] != 0xA5) { discard_one(); continue; }
            if (used_ < 2) return;
            if (buffer_[1] != 0x5A) { discard_one(); continue; }
            if (used_ < 3) return;
            if (buffer_[2] != 1) { discard_one(); continue; }
            if (used_ < 8) return;
            const auto length = static_cast<std::size_t>(buffer_[6]) |
                                (static_cast<std::size_t>(buffer_[7]) << 8);
            if (length > JOBS_MAX_PAYLOAD) { discard_one(); continue; }
            const auto total = length + JOBS_FRAME_OVERHEAD;
            if (used_ < total) return;
            JobsFrameView view{};
            if (jobs_decode(buffer_.data(), total, &view) != JOBS_CODEC_OK) {
                discard_one();
                continue;
            }
            Frame frame{view.opcode, view.sequence,
                        std::vector<std::uint8_t>(view.payload, view.payload + view.length)};
            for (std::size_t i = total; i < used_; ++i) buffer_[i - total] = buffer_[i];
            used_ -= total;
            // 先消费再回调；Sink 不得重入 feed/reset 或抛出异常。
            sink(frame);
        }
    }
};
}
#endif
