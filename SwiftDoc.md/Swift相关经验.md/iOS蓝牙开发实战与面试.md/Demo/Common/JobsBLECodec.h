//
//  JobsBLECodec.h
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

#ifndef JOBS_BLE_CODEC_H
#define JOBS_BLE_CODEC_H
#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

enum { JOBS_MAX_PAYLOAD = 256, JOBS_FRAME_OVERHEAD = 10 };
typedef enum {
    JOBS_CODEC_OK = 0,
    JOBS_CODEC_ARGUMENT = -1,
    JOBS_CODEC_LENGTH = -2,
    JOBS_CODEC_HEADER = -3,
    JOBS_CODEC_CRC = -4
} JobsCodecStatus;

// payload 借用输入内存；调用方不得在输入释放后继续使用。
typedef struct {
    uint8_t opcode;
    uint16_t sequence;
    const uint8_t *payload;
    uint16_t length;
} JobsFrameView;

uint16_t jobs_crc16(const uint8_t *bytes, size_t length);
JobsCodecStatus jobs_encode(uint8_t opcode, uint16_t sequence,
                           const uint8_t *payload, size_t length,
                           uint8_t *output, size_t capacity, size_t *written);
JobsCodecStatus jobs_decode(const uint8_t *bytes, size_t length, JobsFrameView *frame);

#ifdef __cplusplus
}
#endif
#endif
