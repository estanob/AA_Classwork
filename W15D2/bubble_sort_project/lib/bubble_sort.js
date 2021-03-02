function swap(array, idx1, idx2) {
    let swapper = array[idx1];
    array[idx1] = array[idx2];
    array[idx2] = swapper;
    return array;
}

function bubbleSort(array) {
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 0; i < array.length - 1; i++) {
            if (array[i] > array[i + 1]) {
                sorted = false
                let swap = array[i]
                array[i] = array[i + 1]
                array[i + 1] = swap
            }
        }
    };
    return array;
}


module.exports = {
    bubbleSort,
    swap
};