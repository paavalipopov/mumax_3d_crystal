package main

import (
	"io/ioutil"
	"log"
	"strings"
	"os"
	"strconv"
	"fmt"
)

func main() {
	myfile := os.Args[1]
	zerofile := os.Args[2]


	input, err := ioutil.ReadFile(myfile)
	if err != nil {
		log.Fatalln(err)
	}

	lines := strings.Split(string(input), "\n")
	var numbers []string
	var number [3]float64


	zeroinput, err := ioutil.ReadFile(zerofile)
	if err != nil {
		log.Fatalln(err)
	}
	zerolines := strings.Split(string(zeroinput), "\n")
	var zeronumbers []string
	var zeronumber [3]float64


	for i, line := range lines {
			if i > (len(lines) - 4) {
				break
			}
			if strings.Contains(line, "#") {
				continue
			}
			if i < 29 {
				continue
			}
			if strings.Contains(line, "0 0 0") {
				continue
			}

			numbers = strings.Split(line, " ")
			zeronumbers = strings.Split(zerolines[i], " ")

			for j := 0; j < 3; j++ {
				number[j], err = strconv.ParseFloat(numbers[j], 64)
				if err != nil {
					fmt.Printf("fuck")
					break
				}
				zeronumber[j], err = strconv.ParseFloat(zeronumbers[j], 64)
				if err != nil {
					fmt.Printf("fuck")
					break
				}
				number[j] = number[j] - zeronumber[j]
				numbers[j] = strconv.FormatFloat(number[j], 'f', -1, 64)

			}

			lines[i] = numbers[0] + " " + numbers[1] + " " + numbers[2]
	}
	

	
	output := strings.Join(lines, "\n")
	err = ioutil.WriteFile(myfile, []byte(output), 0644)
	if err != nil {
		log.Fatalln(err)
	}
	fmt.Print("Formatting done!\n")
}
