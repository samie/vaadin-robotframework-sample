# Vaadin and Robot Framework Sample
Simple example using [Robot Framework](http://robotframework.org/) with [Vaadin](https://vaadin.com/framework) and Vaadin [TestBench](https://vaadin.com/testbench) Hub. 

This test logs in to https://demo.vaadin.com/dashboard and checks that login was succesful.

## Settings

All settings are specified in the beginning of the [test file](src/test/robotframework/acceptance/dashboard-login.robot)
There are two modes for the test:

 1. Local browser (enabled by default)
 2. TestBench Hub
 
Chrome driver is used in both. If TestBench Hub is used, make sure that the correct URL is given in `${HUB_URL}` in Settings. By default local hub is used and 

## Running

To execute the test locally or using TestBench Hub run:

    mvn verify

    
