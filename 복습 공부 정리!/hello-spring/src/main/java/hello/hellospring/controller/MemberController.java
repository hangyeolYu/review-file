package hello.hellospring.controller;

import hello.hellospring.domain.Member;
import hello.hellospring.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class MemberController {

    //private final MemberService memberService = new MemberService () ;
    //여러개 생성할 필요없이 스프링 컨테이너에 하나만 생성하면 됨

    private MemberService memberService;

    //생성자로 연결
    @Autowired    //memberservice 를 스프링 컨테이너에 있는 memberservice 를 가져와 연결 (주입)
    public MemberController(MemberService memberService){
        this.memberService = memberService;
    }

    //회원가입
    @GetMapping("/members/new")
    public String createForm () {
        return "members/createMemberForm";
    }

    @PostMapping("/members/new")
    public String create (MemberForm form){
        Member member = new Member();
        member.setName(form.getName());

        memberService.join(member);

        return "redirect:/";
    }

    //회원조회
    @GetMapping("members")
    public String list(Model model){
        List<Member> members = memberService.findMember();
        model.addAttribute("members",members);
        return "members/memberList";
    }

}
