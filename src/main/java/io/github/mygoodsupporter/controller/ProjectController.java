package io.github.mygoodsupporter.controller;

import io.github.mygoodsupporter.dao.MemberDAO;
import io.github.mygoodsupporter.domain.Project;
import io.github.mygoodsupporter.dto.SupportProjectForm;
import io.github.mygoodsupporter.security.MemberDetails;
import io.github.mygoodsupporter.service.ProjectService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Slf4j
@Controller
@RequiredArgsConstructor
public class ProjectController {

    private final ProjectService projectService;

    private final MemberDAO memberDAO;

    // 프로젝트 신청 화면 요청 메이커
    @GetMapping(value="/projects/new")
    public String projectRequestPage() {
        return "projects/projectRequest";
    }

    //프로젝트 신청페이지 메이커
    @PostMapping(value="/project/new")
    public String projectRequest(@AuthenticationPrincipal MemberDetails memberDetails, @ModelAttribute Project pdto, Model model){
        //현재 로그인된 아이디 가져옴
        Project project = new Project();
        project.setMemberId(memberDetails.getId());

        pdto = projectService.projectRequest(pdto);
        model.addAttribute("pdto", pdto);
        return "projects/projectList";
    }


    @GetMapping("/projects")
    public String getProjects(Model model) {
        List<Project> projects = projectService.getProjects();

        model.addAttribute("projects", projects);
        return "projects/projectList";
    }

    @GetMapping("/projects/{slug}")
    public String getProjectBySlugName(@PathVariable("slug") String slug, Model model) {
        Project project = projectService.getProjectBySlug(slug);
        model.addAttribute("project", project);
        model.addAttribute("supportProjectForm", new SupportProjectForm());
        return "projects/project";
    }

    @PostMapping("/projects/{slug}/support")
    public String supportProject(@PathVariable("slug") String slug, @AuthenticationPrincipal MemberDetails memberDetails,
                                 SupportProjectForm form, Model model) {
        String memberId =  memberDetails.getId();

        projectService.supportProject(memberId, slug, form.getAmount());

        return "redirect:/projects/" + slug;
    }
}
