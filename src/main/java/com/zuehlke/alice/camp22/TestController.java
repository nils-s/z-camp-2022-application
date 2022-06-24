package com.zuehlke.alice.camp22;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping
    public String hello(@RequestParam(name = "name", defaultValue = "world") String name) {
        return "Hello " + name;
    }
}
