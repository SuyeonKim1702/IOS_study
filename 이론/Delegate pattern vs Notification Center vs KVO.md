### 서로 다른 객체 or 컨트롤러 간의 인터랙션
- Delegate pattern
   - 로직의 흐름을 따라가기 쉬움
   - 많은 줄의 코드가 필요함
   - 	많은 객체들과 커뮤니케이션 해야 하는 상황에서는 적절치 않음
 - Notification Center
   - 많은 객체들과 커뮤니케이션 해야 하는 상황에서 적절
   - 추적이 쉽지않다
   - 	Post 이후에 정보를 받을 수 없다
 - KVO(Key-Value observing)
    - 위 두개는 controller와 객체 사이의 관계를 다루는데 적절
    - kvo는 객체와 객체 사이의 관계를 다루는데 적절
    - 액션에 반응하는 형태 x, 프로퍼티의 상태에 반응하는 형태

