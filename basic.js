/*
 *
 *
 *   Binary Search
 */
// standard
const binarySearch = (list, target) => {
  let i = 0;
  let j = list.length - 1;
  let res = -1;
  while (i <= j) {
    let m = Math.floor(i + (j - i) / 2);
    if (list[m] < target) {
      i = m + 1;
    } else if (list[m] > target) {
      j = m - 1;
    } else {
      res = m;
      break;
    }
  }
  return res;
};

// the left most in targets
const binarySearchFirst = (list, target) => {
  let i = 0;
  let j = list.length - 1;
  let res = -1;
  while (i <= j) {
    let m = Math.floor(i + (j - i) / 2);
    if (list[m] < target) {
      i = m + 1;
    } else if (list[m] > target) {
      j = m - 1;
    } else {
      res = m;
      j = m - 1;
    }
  }
  return res;
};

// the right most in targets
const binarySearchLast = (list, target) => {
  let i = 0;
  let j = list.length - 1;
  let res = -1;
  while (i <= j) {
    let m = Math.floor(i + (j - i) / 2);
    if (list[m] < target) {
      i = m + 1;
    } else if (list[m] > target) {
      j = m - 1;
    } else {
      res = m;
      i = m + 1;
    }
  }
  return res;
};

// LowBound: the biggest that < target
const binarySearchLower = (list, target) => {
  let i = 0;
  let j = list.length - 1;
  let res = -1;
  while (i <= j) {
    let m = Math.floor(i + (j - i) / 2);
    if (list[m] < target) {
      i = m + 1;
      res = m;
    } else {
      j = m - 1;
    }
  }
  return res;
};

// HighBound: the smallest that > target
const binarySearchUpper = (list, target) => {
  let i = 0;
  let j = list.length - 1;
  let res = -1;
  while (i <= j) {
    let m = Math.floor(i + (j - i) / 2);
    if (list[m] <= target) {
      i = m + 1;
    } else {
      j = m - 1;
      res = m;
    }
  }
  return res;
};

/**
 *
 *
 *
 * Quick Sort
 */
// recursive
const quickSort = (list) => {
  if (list.length <= 1) return list;
  const { left, mid, right } = list.reduce(
    (a, c) => {
      if (c === list[0]) a.mid.push(c);
      else if (c < list[0]) a.left.push(c);
      else a.right.push(c);
      return a;
    },
    { left: [], mid: [], right: [] }
  );
  return [...quickSort(left), ...mid, ...quickSort(right)];
};

// in-place,  single boundary???[start, pivot] [p, ...end]
const quickSort2 = (list, start = 0, end = list.length - 1) => {
  if (start >= end) return;
  let p = start; // boundary, ???p????????????value > pivot
  let pivot = list[end];
  for (let i = start; i <= end; ++i) {
    if (list[i] <= pivot) {
      [list[i], list[p]] = [list[p], list[i]];
      p++;
    }
  }
  // ?????? p-1 ?????????pivot???(????????????????????????????????????),
  quickSort2(list, start, p - 2); // ?????? pivot (??????p-1????????? max call stack)
  quickSort2(list, p, end);
};

// in-place,  double boundarys:  [start, i-1], [i==j/pivot], [j+1, end]
const quickSort3 = (list, start = 0, end = list.length - 1) => {
  if (start >= end) return;
  let i = start; // boundary, ???i??????value > pivot
  let j = end; // boundary, ???j??????value < pivot
  let pivot = list[end];
  while (i < j) {
    while (i < j && list[i] <= pivot) ++i;
    [list[i], list[j]] = [list[j], list[i]];
    while (i < j && list[j] >= pivot) --j;
    [list[i], list[j]] = [list[j], list[i]];
  }
  // ???????????????i???j??????, ?????????????????????pivot
  list[i] = pivot;

  quickSort3(list, start, i - 1);
  quickSort3(list, i + 1, end);
};

/**
 *
 *
 *
 * Union-Find
 */
class UnionFind {
  union(x, y) {
    const rootX = this.find(x);
    const rootY = this.find(y);
    if (rootX === rootY) return;
    this[rootX] = rootY;
  }
  find(x) {
    if (undefined === this[x]) this[x] = x;
    return this[x] === x ? x : this.find(this[x]);
  }
}

/**
 *
 *
 *
 * Trie
 */
class Trie {
  insert(arr) {
    let node = this;
    for (const e of arr) {
      node[e] = node[e] ?? new Trie();
      node = node[e];
    }
    node.isEnd = true;
  }

  has(arr) {
    let node = this;
    for (const e of arr) {
      if (!(e in node)) return false;
      node = node[e];
    }
    return node.isEnd;
  }

  startsWith(prefixArr) {
    let node = this;
    for (const e of prefixArr) {
      if (!(e in node)) return false;
      node = node[e];
    }
    return true;
  }
}

// const trie = new Trie();
// trie.insert(["a", "b", "c"]);
// console.log(trie);
// console.log(trie.has(["a", "b", "c"]), trie.has(["a", "b"]));
// console.log(trie.startsWith(["a", "b", "c"]), trie.startsWith(["a", "b", "a"]));
