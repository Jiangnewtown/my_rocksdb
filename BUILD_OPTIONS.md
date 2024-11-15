# RocksDB 编译选项说明

> 本文档翻译自 RocksDB 官方文档：
> - [INSTALL.md](https://github.com/facebook/rocksdb/blob/main/INSTALL.md)
> - [CMakeLists.txt](https://github.com/facebook/rocksdb/blob/main/CMakeLists.txt)
> - [ROCKSDB BASICS](https://github.com/facebook/rocksdb/wiki/RocksDB-Basics)

## 基础编译选项

- `CMAKE_BUILD_TYPE`: 编译类型
  - `Release`: 发布版本，优化级别最高
  - `Debug`: 调试版本，包含调试信息
  - `RelWithDebInfo`: 带调试信息的发布版本
  - `MinSizeRel`: 最小体积的发布版本

- `ROCKSDB_BUILD_SHARED`: 是否构建动态库
  - `ON`: 构建动态库（.so/.dll）
  - `OFF`: 只构建静态库（.a/.lib）

## 功能开关选项

- `WITH_GFLAGS`: 是否启用 gflags 支持
  - `ON`: 启用 gflags（需要安装 gflags 库）
  - `OFF`: 禁用 gflags

- `WITH_SNAPPY`: 是否启用 Snappy 压缩
  - `ON`: 启用 Snappy 压缩（需要安装 snappy 库）
  - `OFF`: 禁用 Snappy 压缩

- `WITH_LZ4`: 是否启用 LZ4 压缩
  - `ON`: 启用 LZ4 压缩（需要安装 lz4 库）
  - `OFF`: 禁用 LZ4 压缩

- `WITH_ZLIB`: 是否启用 ZLIB 压缩
  - `ON`: 启用 ZLIB 压缩（需要安装 zlib 库）
  - `OFF`: 禁用 ZLIB 压缩

- `WITH_ZSTD`: 是否启用 ZSTD 压缩
  - `ON`: 启用 ZSTD 压缩（需要安装 zstd 库）
  - `OFF`: 禁用 ZSTD 压缩

## 组件编译选项

- `WITH_TESTS`: 是否编译测试
  - `ON`: 编译测试用例
  - `OFF`: 不编译测试用例

- `WITH_TOOLS`: 是否编译工具
  - `ON`: 编译命令行工具
  - `OFF`: 不编译命令行工具

- `WITH_EXAMPLES`: 是否编译示例
  - `ON`: 编译示例程序
  - `OFF`: 不编译示例程序

- `WITH_BENCHMARK_TOOLS`: 是否编译基准测试工具
  - `ON`: 编译基准测试工具
  - `OFF`: 不编译基准测试工具

## 性能相关选项

- `WITH_ASAN`: 是否启用 Address Sanitizer
  - `ON`: 启用 ASAN（用于内存问题检测）
  - `OFF`: 禁用 ASAN

- `WITH_TSAN`: 是否启用 Thread Sanitizer
  - `ON`: 启用 TSAN（用于线程问题检测）
  - `OFF`: 禁用 TSAN

- `WITH_JEMALLOC`: 是否使用 jemalloc 内存分配器
  - `ON`: 使用 jemalloc（需要安装 jemalloc）
  - `OFF`: 使用系统默认内存分配器

## 示例用法

基本编译（仅编译库和示例）：

## 依赖库安装

在 Ubuntu/Debian 系统上安装依赖：