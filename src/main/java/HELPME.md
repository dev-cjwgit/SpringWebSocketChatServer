

`@RequestParam` = 인자 있는 그대로를 받음 안쓰면 MyBatis가 멍청해서 DTO에서 찾아씀
해당 어노테이션은 컨트롤러단에서 한 번만 사용하면 됨.

`@ModelAttribute` = GET 파라미터가 3개 이상이 넘어가면 사용함