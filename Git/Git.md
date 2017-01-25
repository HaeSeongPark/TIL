# Tip
* 여러 버전을 건너뛰어 revert 하게 되면 충돌이 생길 수 있으므로 순차적으로 Reert해야 안전하다. 
* [git 맛보기 사이트](https://try.github.io/levels/1/challenges/1) 하고나면 CodeSchool의 [git강의](http://gitreal.codeschool.com/levels/1)로 이동된다. 보니까 git real ,git real2, Mastering GitHub 이렇게 3강의가 더 있다. git을 더 자세히 배울 수 있을 것 같다는 기대가 든다. 무료이고 영어이다.
* 충돌이 났을 때 eclipse compare with 이용해 편리하게 충돌 해결하기, eclipse외에도 많은 도구가 있음
* [[위키디피아 diif 도구 ]](http://en.wikipedia.org/wiki/Comparison_of_file_comparison_tools)
* stash 
    - add나 commit하지 않는 변경사항을 저장. 
    - 충돌날 수 있음. 
    - working copy와 staged area에 같은 파일이 있으면 합쳐진상태로 stash 됨
* tag
   - 의미있는 commit에 꼬리표를 달아놓는 것. ex)버전정보, 
   - tag가 달린 commit버전으로 브랜치  생성가능
   - tag는 원격저장소(remote)에 push할 때 자동으로 안 됨. push all tags(소스트리)체크해야함
   - github에서는 release탭에서 tag정보 관리
* .gitignore
    - 깃 버전관리 대상에서 제외
    - 특정파일의 이름만 제외, 확장자명으로 제외, 사용자정의패턴으로 제외
    - [[참고 사이트1 : gitignore.io]](https://www.gitignore.io/)
    - [[참고 사이트2 : glob wiki]](https://en.wikipedia.org/wiki/Glob_(programming))
