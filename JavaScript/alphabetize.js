var moonWalkers = [
  "Neil Armstrong",
  "Buzz Aldrin",
  "Pete Conrad",
  "Alan Bean",
  "Alan Shepard",
  "Edgar Mitchell",
  "David Scott",
  "James Irwin",
  "John Young",
  "Charles Duke",
  "Eugene Cernan",
  "Harrison Schmitt"
];

function alphabetizer(names) {
    names.forEach(function(element, index, array){
        separatedName = element.split(" ");
        array[index] = separatedName[1] + ", " + separatedName[0];
    });
    return names.sort();
}

// Try logging your results to test your code!
console.log(alphabetizer(moonWalkers));