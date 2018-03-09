step6 야드 길이 변 환과 반복입력 JK피드백 반영

 -> 일단 enum 살리면서 진행



        무게와 부피가 추가됐는데, Unit 이나 Units 에는 들어갔는데 객체는 Length 뿐이네요. 무게랑 부피는 객체가 없나요?

       Unit 에 길이, 무게, 부피가 다 들어있는데 다 합쳐서 표현하는게 좋을까요? 아니면 의미 단위로 분리하는게 좋을까요 어떻게 생각하세요?



-> Length, LengthUnit, Weigth, WeigthUnit, Volume, VolumeUnit 만들기



RhinoUnitConverter 객체가 조금 복잡해 보입니다.

입력하고 검사하는 객체와 변환을 담당하는 객체, 그리고 결과를 출력하는 객체로... 분리해봅시다.

start() 함수는 어디에 포함되야 할까요?



-> RhinoUnitConverter가 복잡해 보이는 것은 유효체크를 하는 것 때문이라고 판단되서

  입력하는 것과 start()는 그대로 RhinoUnitConverrter에 두고 검사하는 객체만InvalidChecker로 따로 만들기
