#!/bin/bash

# 检查并安装依赖
if ! dpkg -l | grep -q "libgflags-dev\|libsnappy-dev"; then
    echo "Installing dependencies..."
    sudo apt-get update
    sudo apt-get install -y libgflags-dev libsnappy-dev
fi

# 初始化并更新子模块
git submodule init
git submodule update

# 创建构建目录
mkdir -p build
cd build

# 运行cmake配置
cmake -DCMAKE_BUILD_TYPE=Release \
      -DWITH_GFLAGS=ON \
      -DWITH_SNAPPY=ON \
      -DROCKSDB_BUILD_SHARED=OFF \
      -DWITH_TESTS=OFF \
      -DWITH_TOOLS=ON \
      -DWITH_EXAMPLES=ON \
      -DWITH_BENCHMARK_TOOLS=ON \
      ..

# 编译
make -j$(nproc)

echo "====================== 运行基准测试 ======================"
echo "测试参数说明："
echo "- benchmarks=fillseq: 顺序写入测试"
echo "- num=1000: 写入1000条记录"
echo "- stats_interval_seconds=1: 每秒输出统计信息"
echo "- histogram: 输出延迟直方图"
echo "========================================================="

./db_bench \
    --benchmarks=fillseq \
    --num=1000 \
    --stats_interval_seconds=1 \
    --histogram \
    --statistics \
    | tee benchmark_results.txt

echo "基准测试结果已保存到 benchmark_results.txt"
echo

echo "====================== 运行示例程序 ======================"
cd examples

for example in simple_example column_families_example c_simple_example \
               optimistic_transaction_example transaction_example \
               compaction_filter_example options_file_example; do
    echo
    echo "运行 ${example}..."
    echo "--------------------------------------------------------"
    ./${example}
    echo "--------------------------------------------------------"
    echo "${example} 运行完成"
    echo
    sleep 1  # 添加短暂延迟，使输出更易读
done

cd ..

echo "===================== 所有程序运行完成 ===================="