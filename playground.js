/*
Question 1 : There is N delivery centers. Each Devliery Outlet has some packages to be delivered, denoted by parcels[i]. There is a Rule how delivery should be completed. On each day, an equal number of parcerls are to be dispatched from each delivery center that has atleast one parcel remaining.

Find minimum nunmber of days needed to deliver all the parcels.
Input:
parcels= {2,3,4,3,3}

Output
3
*/

function findDup(nums) {
  let i = 0;
  while (true) {
    let val = nums[i];
    if (val === nums[val]) return val;
    i = nums[val];
    nums[val] = val;
  }
}

findDup([2, 5, 9, 6, 9, 3, 8, 9, 7, 1]);
