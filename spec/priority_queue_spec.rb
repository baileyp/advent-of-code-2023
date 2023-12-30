require_relative '../lib/priority_queue'

describe PriorityQueue do
  describe ".PriorityQueue" do
    it "basic test with scalars" do
      pq = PriorityQueue.new
      pq << 'c'
      pq << 'a'
      pq << 'b'
      expect(pq.pop).to eq('a')
    end

    it "basic test with lists" do
      pq = PriorityQueue.new
      pq << [4, 1]
      pq << [1, 1000]
      pq << [3, 10]
      expect(pq.pop).to eq([1, 1000])
    end

    it "does multiple pops correctly" do
      pq = PriorityQueue.new
      pq << [4, 1]
      pq << [1, 1000]
      pq << [3, 10]
      expect(pq.pop).to eq([1, 1000])
      expect(pq.pop).to eq([3, 10])
      expect(pq.pop).to eq([4, 1])
    end

    it "does empty checks correctly" do
      pq = PriorityQueue.new
      expect(pq.empty?).to eq(true)
      pq << [4, 1]
      expect(pq.empty?).to eq(false)
      pq.pop
      expect(pq.empty?).to eq(true)
    end
  end
end
