package edu.northwestu.intc3283.datasourcestarter.controller;

import edu.northwestu.intc3283.datasourcestarter.repositoryup.DonorsRepository;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/reports")

public class ReportsController {

    private  final DonorsRepository donorsRepository;

    public ReportsController(DonorsRepository donorsRepository) {
        this.donorsRepository = donorsRepository;
    }


    @GetMapping("/weekly-donations")
    public String weeklyDonationReports (Model model) {
       LocalDate startDate = LocalDate.now().minusWeeks(1);
       LocalDate endDate = LocalDate.now();
        model.addAttribute("donatedByWeek", this.donorsRepositoryu.weeklyDonationReport(startDate, endDate));

        return "donors/weekly-donations.html";
    }
}
