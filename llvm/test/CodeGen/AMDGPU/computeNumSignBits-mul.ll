; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc  -mtriple=amdgcn-amd-amdhsa -mcpu=gfx900 -o - -amdgpu-codegenprepare-mul24=0 < %s | FileCheck -check-prefix=GFX9 %s

define i16 @num_sign_bits_mul_i48_0(i8 %X, i8 %Y, i8 %Z, i8 %W) {
; GFX9-LABEL: num_sign_bits_mul_i48_0:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_mul_i32_i24_sdwa v0, sext(v0), sext(v1) dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:BYTE_0 src1_sel:BYTE_0
; GFX9-NEXT:    v_mul_i32_i24_sdwa v1, sext(v2), sext(v3) dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:BYTE_0 src1_sel:BYTE_0
; GFX9-NEXT:    v_mul_i32_i24_e32 v0, v0, v1
; GFX9-NEXT:    s_setpc_b64 s[30:31]
  %A = sext i8 %X to i48
  %B = sext i8 %Y to i48
  %C = sext i8 %Z to i48
  %D = sext i8 %W to i48
  %mul0 = mul i48 %A, %B
  %mul1 = mul i48 %C, %D
  %mul2 = mul i48 %mul0, %mul1
  %trunc = trunc i48 %mul2 to i16
  ret i16 %trunc
}

define i16 @num_sign_bits_mul_i48_1(i8 %X, i8 %Y, i8 %Z, i8 %W) {
; GFX9-LABEL: num_sign_bits_mul_i48_1:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_mul_i32_i24_sdwa v0, sext(v0), sext(v1) dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:BYTE_0 src1_sel:BYTE_0
; GFX9-NEXT:    v_mul_i32_i24_sdwa v2, sext(v2), sext(v3) dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:BYTE_0 src1_sel:BYTE_0
; GFX9-NEXT:    v_mul_hi_i32_i24_e32 v1, v0, v2
; GFX9-NEXT:    v_mul_i32_i24_e32 v0, v0, v2
; GFX9-NEXT:    v_lshrrev_b64 v[0:1], 24, v[0:1]
; GFX9-NEXT:    s_setpc_b64 s[30:31]
  %A = sext i8 %X to i48
  %B = sext i8 %Y to i48
  %C = sext i8 %Z to i48
  %D = sext i8 %W to i48
  %mul0 = mul i48 %A, %B
  %mul1 = mul i48 %C, %D
  %mul2 = mul i48 %mul0, %mul1
  %ashr = ashr i48 %mul2, 24
  %trunc = trunc i48 %ashr to i16
  ret i16 %trunc
}

define i32 @num_sign_bits_mul_i32_7(i32 %x, i32 %y, i32 %z, i32 %w) {
; GFX9-LABEL: num_sign_bits_mul_i32_7:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_bfe_i32 v0, v0, 0, 25
; GFX9-NEXT:    v_bfe_i32 v1, v1, 0, 25
; GFX9-NEXT:    v_bfe_i32 v2, v2, 0, 25
; GFX9-NEXT:    v_bfe_i32 v3, v3, 0, 25
; GFX9-NEXT:    v_mul_lo_u32 v0, v0, v1
; GFX9-NEXT:    v_mul_lo_u32 v1, v2, v3
; GFX9-NEXT:    v_mul_lo_u32 v0, v0, v1
; GFX9-NEXT:    s_setpc_b64 s[30:31]
  %x.shl = shl i32 %x, 7
  %x.bits = ashr i32 %x.shl, 7

  %y.shl = shl i32 %y, 7
  %y.bits = ashr i32 %y.shl, 7

  %z.shl = shl i32 %z, 7
  %z.bits = ashr i32 %z.shl, 7

  %w.shl = shl i32 %w, 7
  %w.bits = ashr i32 %w.shl, 7

  %mul0 = mul i32 %x.bits, %y.bits
  %mul1 = mul i32 %z.bits, %w.bits
  %mul2 = mul i32 %mul0, %mul1
  ret i32 %mul2
}

define i32 @num_sign_bits_mul_i32_8(i32 %x, i32 %y, i32 %z, i32 %w) {
; GFX9-LABEL: num_sign_bits_mul_i32_8:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_mul_i32_i24_e32 v0, v0, v1
; GFX9-NEXT:    v_mul_i32_i24_e32 v1, v2, v3
; GFX9-NEXT:    v_mul_lo_u32 v0, v0, v1
; GFX9-NEXT:    s_setpc_b64 s[30:31]
  %x.shl = shl i32 %x, 8
  %x.bits = ashr i32 %x.shl, 8

  %y.shl = shl i32 %y, 8
  %y.bits = ashr i32 %y.shl, 8

  %z.shl = shl i32 %z, 8
  %z.bits = ashr i32 %z.shl, 8

  %w.shl = shl i32 %w, 8
  %w.bits = ashr i32 %w.shl, 8

  %mul0 = mul i32 %x.bits, %y.bits
  %mul1 = mul i32 %z.bits, %w.bits
  %mul2 = mul i32 %mul0, %mul1
  ret i32 %mul2
}

define i32 @num_sign_bits_mul_i32_9(i32 %x, i32 %y, i32 %z, i32 %w) {
; GFX9-LABEL: num_sign_bits_mul_i32_9:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_bfe_i32 v0, v0, 0, 23
; GFX9-NEXT:    v_bfe_i32 v1, v1, 0, 23
; GFX9-NEXT:    v_bfe_i32 v2, v2, 0, 23
; GFX9-NEXT:    v_bfe_i32 v3, v3, 0, 23
; GFX9-NEXT:    v_mul_i32_i24_e32 v0, v0, v1
; GFX9-NEXT:    v_mul_i32_i24_e32 v1, v2, v3
; GFX9-NEXT:    v_mul_lo_u32 v0, v0, v1
; GFX9-NEXT:    s_setpc_b64 s[30:31]
  %x.shl = shl i32 %x, 9
  %x.bits = ashr i32 %x.shl, 9

  %y.shl = shl i32 %y, 9
  %y.bits = ashr i32 %y.shl, 9

  %z.shl = shl i32 %z, 9
  %z.bits = ashr i32 %z.shl, 9

  %w.shl = shl i32 %w, 9
  %w.bits = ashr i32 %w.shl, 9

  %mul0 = mul i32 %x.bits, %y.bits
  %mul1 = mul i32 %z.bits, %w.bits
  %mul2 = mul i32 %mul0, %mul1
  ret i32 %mul2
}

define i32 @num_sign_bits_mul_i32_10(i32 %x, i32 %y, i32 %z, i32 %w) {
; GFX9-LABEL: num_sign_bits_mul_i32_10:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_bfe_i32 v0, v0, 0, 22
; GFX9-NEXT:    v_bfe_i32 v1, v1, 0, 22
; GFX9-NEXT:    v_bfe_i32 v2, v2, 0, 22
; GFX9-NEXT:    v_bfe_i32 v3, v3, 0, 22
; GFX9-NEXT:    v_mul_i32_i24_e32 v0, v0, v1
; GFX9-NEXT:    v_mul_i32_i24_e32 v1, v2, v3
; GFX9-NEXT:    v_mul_lo_u32 v0, v0, v1
; GFX9-NEXT:    s_setpc_b64 s[30:31]
  %x.shl = shl i32 %x, 10
  %x.bits = ashr i32 %x.shl, 10

  %y.shl = shl i32 %y, 10
  %y.bits = ashr i32 %y.shl, 10

  %z.shl = shl i32 %z, 10
  %z.bits = ashr i32 %z.shl, 10

  %w.shl = shl i32 %w, 10
  %w.bits = ashr i32 %w.shl, 10

  %mul0 = mul i32 %x.bits, %y.bits
  %mul1 = mul i32 %z.bits, %w.bits
  %mul2 = mul i32 %mul0, %mul1
  ret i32 %mul2
}

; GFX9-LABEL: known_bits_mul24:
; GFX9: v_mov_b32_e32 v0, 0
; GFX9-NEXT:    s_setpc_b64
define i32 @known_bits_mul24() {
  %r0 = call i32 @llvm.amdgcn.mul.i24(i32 0, i32 -7)
  %r1 = shl i32 %r0, 2
  ret i32 %r1
}

declare i32 @llvm.amdgcn.mul.i24(i32, i32)
