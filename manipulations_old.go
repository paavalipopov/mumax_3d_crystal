package main

import (
	"io/ioutil"
	"log"
	"strings"
	"os"
	"strconv"
	"fmt"
	"math"
)

func main() {
	mode := os.Args[1]
	myfile := os.Args[2]
	outfile := os.Args[3]
	var zerofile string
	if mode != "scalarization" {
		zerofile = os.Args[4]
	}

	input, err := ioutil.ReadFile(myfile)
	if err != nil {
		log.Fatalln(err)
	}

	lines := strings.Split(string(input), "\n")
	var numbers []string
	var number [3]float64

	maxNumber := 0.0
	minNumber := 1e64
	var zeroinput []byte
	var zerolines []string
	var zeronumbers []string
	var zeronumber [3]float64
	if mode != "scalarization" {
		zeroinput, err = ioutil.ReadFile(zerofile)
		if err != nil {
			log.Fatalln(err)
		}
		zerolines = strings.Split(string(zeroinput), "\n")
	}

	switch {
	case mode == "m":
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

	case mode == "scalarization":
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
			for j := 0; j < 3; j++ {
				number[j], err = strconv.ParseFloat(numbers[j], 64)
				if err != nil {
					fmt.Printf("fuck")
					break
				}
			}
			number[0] = math.Sqrt(math.Pow(number[0],2) + math.Pow(number[1],2) +math.Pow(number[2],2))
			number[1] = 0.0
			number[2] = 0.0

			if maxNumber < number[0] {
				maxNumber = number[0]
			}
			if minNumber > number[0] {
				minNumber = number[0]
			}
			for j := 0; j < 3; j++ {
				numbers[j] = strconv.FormatFloat(number[j], 'f', -1, 64)
			}
			lines[i] = numbers[0] + " " + numbers[1] + " " + numbers[2]
		}
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
			for j := 0; j < 3; j++ {
				number[j], err = strconv.ParseFloat(numbers[j], 64)
				if err != nil {
					fmt.Printf("fuck")
					break
				}
			}
			number[1] = math.Cos((number[0] - minNumber)/(maxNumber - minNumber)*math.Pi)
			number[2] = math.Sin((number[0] - minNumber)/(maxNumber - minNumber)*math.Pi)
			number[0] = 0.0
			for j := 0; j < 3; j++ {
				numbers[j] = strconv.FormatFloat(number[j], 'f', -1, 64)
			}
			lines[i] = numbers[0] + " " + numbers[1] + " " + numbers[2]
		}

	default:
		fmt.Print("Nothing to do here\n")
	}

	output := strings.Join(lines, "\n")
	err = ioutil.WriteFile(outfile + "_edited", []byte(output), 0644)
	if err != nil {
		log.Fatalln(err)
	}
	fmt.Print("Formatting done!\n")
}
