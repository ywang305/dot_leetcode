require 'algorithms'
include Containers

## -- test Containers::PriorityQueue  --
Person = Data.define(:name, :age)
persons = [Person.new(name: 'Zhang', age: 50), Person.new(name: 'Wang', age: 60), Person.new(name: 'Brad', age: 9)]
pq = PriorityQueue.new do |f1, f2|
  f1 <=> f2
end

persons.each do |per|
  pq.push(per, per.age) # per.age -> field in comparator
end

puts pq.pop, pq.pop, pq.pop
## -- end --
