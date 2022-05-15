/*
Question 1 : There is N delivery centers. Each Devliery Outlet has some packages to be delivered, denoted by parcels[i]. There is a Rule how delivery should be completed. On each day, an equal number of parcerls are to be dispatched from each delivery center that has atleast one parcel remaining.

Find minimum nunmber of days needed to deliver all the parcels.
Input:
parcels= {2,3,4,3,3}

Output
3
*/
function getMinimumDays(parcels) {
  // solutino O(logn)
  let min = 0;
  let max = 0;
  for (let i = 0; i < parcels.length; i++) {
    min = Math.min(min, parcels[i]);
    max = Math.max(max, parcels[i]);
  }
  let mid = Math.floor((min + max) / 2);
  while (min <= max) {
    let count = 0;
    for (let i = 0; i < parcels.length; i++) {
      count += Math.ceil(parcels[i] / mid);
    }
    if (count > mid) {
      min = mid + 1;
    } else {
      max = mid - 1;
    }
    mid = Math.floor((min + max) / 2);
  }
  return mid;
}
