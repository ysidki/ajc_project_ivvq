#!/usr/bin/env node

const fs = require('fs');

const myArgs = process.argv.slice(2);

 

fs.readFile(myArgs[0], function(err, data) {

    if(err) throw err;

 

    const list_char = ['[',']','│','└','\n','┌',' ','\'']

    const arr = data.toString().split('→');

    let list_test_cases = arr.toString().split('list_tests_to_execute = [').toString().split(']')[arr.length - 1]

    for (let i of list_char){

        list_test_cases = list_test_cases.toString().split(i).join('')

    }

    console.log(list_test_cases.substring(1))

});