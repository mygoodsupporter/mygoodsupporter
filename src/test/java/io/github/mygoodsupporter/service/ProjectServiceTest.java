//package io.github.mygoodsupporter.service;
//
//import io.github.mygoodsupporter.domain.project.Project;
//import io.github.mygoodsupporter.dto.ProjectDTO;
//import io.github.mygoodsupporter.exception.ProjectNotFoundException;
//import io.github.mygoodsupporter.mapper.ProjectMapper;
//import org.junit.jupiter.api.Test;
//import org.junit.jupiter.api.extension.ExtendWith;
//import org.mockito.InjectMocks;
//import org.mockito.Mock;
//import org.mockito.junit.jupiter.MockitoExtension;
//
//import static org.assertj.core.api.Assertions.assertThat;
//import static org.assertj.core.api.Assertions.assertThatThrownBy;
//import static org.mockito.ArgumentMatchers.any;
//import static org.mockito.ArgumentMatchers.anyLong;
//import static org.mockito.BDDMockito.given;
//import static org.mockito.BDDMockito.then;
//import static org.mockito.Mockito.doAnswer;
//
//@ExtendWith(MockitoExtension.class)
//public class ProjectServiceTest {
//
//    @InjectMocks
//    ProjectService projectService;
//
//    @Mock
//    ProjectMapper projectMapper;
//
//    @Test
//    void createProject() {
//        //given
//        Long userId = 1L;
//        Long categoryId = 1L;
//        String title = "title";
//        String subtitle = "subtitle";
//        Long generatedProjectId = 3L;
//
//        doAnswer(invocationOnMock -> {
//            Project argument = invocationOnMock.getArgument(0, Project.class);
//            argument.setId(generatedProjectId);
//            return null;
//        }).when(projectMapper).insertProject(any(Project.class));
//
//        //when
//        ProjectDTO dto = new ProjectDTO();
//        dto.setUserId(userId);
//        dto.setCategoryId(categoryId);
//        dto.setTitle(title);
//        dto.setSubtitle(subtitle);
//
//        Long projectId = projectService.createProject(dto);
//
//        //then
//        assertThat(projectId).isEqualTo(generatedProjectId);
//        then(projectMapper).should().insertProject(any(Project.class));
//    }
//
//    @Test
//    void deleteProject() {
//        //given
//        Project saved = Project.createProject(1L, 1L, "subtitle");
//        given(projectMapper.getProjectById(anyLong())).willReturn(saved);
//
//        //when
//        projectService.deleteProject(1L);
//
//        //then
//        then(projectMapper).should().deleteProject(anyLong());
//    }
//
//    @Test
//    void deleteNoneExistsProject() {
//
//        given(projectMapper.getProjectById(anyLong())).willReturn(null);
//
//        assertThatThrownBy(() -> {
//            projectService.deleteProject(1L);
//        }).isInstanceOf(ProjectNotFoundException.class);
//    }
//}