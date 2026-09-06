//
//  JobsBLECodec.c
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

#include "JobsBLECodec.h"
#include <string.h>

static uint16_t read_le16(const uint8_t *p) {
    return (uint16_t)((uint16_t)p[0] | ((uint16_t)p[1] << 8));
}

static void write_le16(uint8_t *p, uint16_t value) {
    p[0] = (uint8_t)value;
    p[1] = (uint8_t)(value >> 8);
}

uint16_t jobs_crc16(const uint8_t *bytes, size_t length) {
    uint16_t crc = 0xFFFF;
    for (size_t i = 0; i < length; ++i) {
        crc ^= (uint16_t)((uint16_t)bytes[i] << 8);
        for (unsigned bit = 0; bit < 8; ++bit) {
            crc = (uint16_t)((crc & 0x8000) ? (crc << 1) ^ 0x1021 : crc << 1);
        }
    }
    return crc;
}

JobsCodecStatus jobs_encode(uint8_t opcode, uint16_t sequence,
                           const uint8_t *payload, size_t length,
                           uint8_t *output, size_t capacity, size_t *written) {
    if (written) *written = 0;
    if (!output || !written || (!payload && length)) return JOBS_CODEC_ARGUMENT;
    if (length > JOBS_MAX_PAYLOAD || capacity < length + JOBS_FRAME_OVERHEAD) return JOBS_CODEC_LENGTH;
    // 此 API 要求输入 payload 与 output 不重叠。
    output[0] = 0xA5;
    output[1] = 0x5A;
    output[2] = 1;
    output[3] = opcode;
    write_le16(output + 4, sequence);
    write_le16(output + 6, (uint16_t)length);
    if (length) memcpy(output + 8, payload, length);
    write_le16(output + 8 + length, jobs_crc16(output + 2, 6 + length));
    *written = length + JOBS_FRAME_OVERHEAD;
    return JOBS_CODEC_OK;
}

JobsCodecStatus jobs_decode(const uint8_t *bytes, size_t length, JobsFrameView *frame) {
    if (!frame) return JOBS_CODEC_ARGUMENT;
    *frame = (JobsFrameView){0};
    if (!bytes) return JOBS_CODEC_ARGUMENT;
    if (length < JOBS_FRAME_OVERHEAD) return JOBS_CODEC_LENGTH;
    if (bytes[0] != 0xA5 || bytes[1] != 0x5A || bytes[2] != 1) return JOBS_CODEC_HEADER;
    uint16_t payload_length = read_le16(bytes + 6);
    if (payload_length > JOBS_MAX_PAYLOAD || length != (size_t)payload_length + JOBS_FRAME_OVERHEAD) return JOBS_CODEC_LENGTH;
    if (read_le16(bytes + 8 + payload_length) != jobs_crc16(bytes + 2, 6 + payload_length)) return JOBS_CODEC_CRC;
    frame->opcode = bytes[3];
    frame->sequence = read_le16(bytes + 4);
    frame->payload = bytes + 8;
    frame->length = payload_length;
    return JOBS_CODEC_OK;
}
