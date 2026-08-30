//
//  main.cpp
//  JobsBluetoothLearningTests
//
//  Created by Jobs on 2026年8月30日，星期日.
//

#include "JobsFrameStream.hpp"
#include <cassert>
#include <iomanip>
#include <iostream>

static std::vector<std::uint8_t> encode(std::uint8_t opcode, std::uint16_t sequence,
                                       const std::vector<std::uint8_t> &payload) {
    std::vector<std::uint8_t> output(JOBS_MAX_PAYLOAD + JOBS_FRAME_OVERHEAD);
    std::size_t written = 0;
    assert(jobs_encode(opcode, sequence, payload.data(), payload.size(),
                       output.data(), output.size(), &written) == JOBS_CODEC_OK);
    output.resize(written);
    return output;
}

int main() {
    const std::uint8_t check[] = {'1','2','3','4','5','6','7','8','9'};
    assert(jobs_crc16(check, sizeof check) == 0x29B1);
    const auto golden = encode(0x10, 1, {1});
    const std::vector<std::uint8_t> fixture{0xA5, 0x5A, 1, 0x10, 1, 0, 1, 0, 1, 0x6B, 0xDE};
    assert(golden == fixture);
    std::cout << "Golden: ";
    for (auto b : golden) std::cout << std::hex << std::setw(2) << std::setfill('0') << static_cast<unsigned>(b);
    std::cout << '\n';
    JobsFrameView view{};
    for (std::size_t size = 0; size <= JOBS_MAX_PAYLOAD; ++size) {
        std::vector<std::uint8_t> payload(size);
        for (std::size_t i = 0; i < size; ++i) payload[i] = static_cast<std::uint8_t>(i);
        const auto frame = encode(0x90, UINT16_MAX, payload);
        assert(jobs_decode(frame.data(), frame.size(), &view) == JOBS_CODEC_OK);
        assert(view.length == size && view.sequence == UINT16_MAX && view.opcode == 0x90);
        assert(std::vector<std::uint8_t>(view.payload, view.payload + view.length) == payload);
        for (std::size_t split = 0; split <= frame.size(); ++split) {
            jobs::FrameStream stream;
            unsigned count = 0;
            auto sink = [&](const jobs::Frame &decoded) { ++count; assert(decoded.payload == payload); };
            stream.feed(frame.data(), split, sink);
            stream.feed(frame.data() + split, frame.size() - split, sink);
            assert(count == 1 && stream.buffered() == 0);
        }
    }
    for (std::size_t cut = 0; cut < golden.size(); ++cut)
        assert(jobs_decode(golden.data(), cut, &view) != JOBS_CODEC_OK);
    for (std::size_t i = 0; i < golden.size(); ++i) {
        auto corrupt = golden;
        corrupt[i] ^= 1;
        assert(jobs_decode(corrupt.data(), corrupt.size(), &view) != JOBS_CODEC_OK);
    }
    std::uint8_t small[10]{};
    std::size_t written = 99;
    assert(jobs_encode(1, 1, check, sizeof check, small, sizeof small, &written) == JOBS_CODEC_LENGTH);
    assert(written == 0);
    assert(jobs_encode(1, 1, nullptr, 1, small, sizeof small, &written) == JOBS_CODEC_ARGUMENT);
    assert(jobs_encode(1, 1, check, 257, small, sizeof small, &written) == JOBS_CODEC_LENGTH);
    assert(jobs_decode(nullptr, 0, &view) == JOBS_CODEC_ARGUMENT);
    assert(jobs_decode(golden.data(), golden.size(), nullptr) == JOBS_CODEC_ARGUMENT);
    auto corrupt = golden;
    corrupt.back() ^= 1;
    std::vector<std::uint8_t> combined{0, 0xFF, 0xA5, 0x5A, 1, 0x10, 1, 0, 0xFF, 0xFF};
    combined.insert(combined.end(), corrupt.begin(), corrupt.end());
    combined.insert(combined.end(), golden.begin(), golden.end());
    combined.insert(combined.end(), golden.begin(), golden.end());
    jobs::FrameStream stream;
    unsigned count = 0;
    stream.feed(combined.data(), combined.size(), [&](const jobs::Frame &) { ++count; });
    assert(count == 2 && stream.buffered() == 0);
    stream.feed(golden.data(), 5, [](const jobs::Frame &) { assert(false); });
    assert(stream.buffered() == 5);
    stream.reset();
    assert(stream.buffered() == 0);
    std::vector<std::uint8_t> noise(100000, 0xFF);
    stream.feed(noise.data(), noise.size(), [](const jobs::Frame &) { assert(false); });
    assert(stream.buffered() == 0);
    std::cout << "PASS C/C++: CRC, 257 lengths, every split, corruption, limits, resync, reset, noise\n";
}
