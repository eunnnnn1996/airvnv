const January = document.getElementById('January').innerText;
const Feburary = document.getElementById('Feburary').innerText;
const March = document.getElementById('March').innerText;
const April = document.getElementById('April').innerText;
const May = document.getElementById('May').innerText;
const June = document.getElementById('June').innerText;
const July = document.getElementById('July').innerText;
const August = document.getElementById('August').innerText;
const September = document.getElementById('September').innerText;
const October = document.getElementById('October').innerText;
const November = document.getElementById('November').innerText;
const December = document.getElementById('December').innerText;

//차트를 그럴 영역을 dom요소로 가져온다.
var chartArea = document.getElementById('houseCountChart').getContext('2d');
// 차트를 생성한다. 
var myChart = new Chart(chartArea, {
    // ①차트의 종류(String)
    type: 'line',
    // ②차트의 데이터(Object)
    data: {
        // ③x축에 들어갈 이름들(Array)
        labels: ['1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
        datasets: [{
            // ⑤dataset의 이름(String)
            label: '총 조회수',
            // ⑥dataset값(Array)
            data: [January,Feburary,March,April,May,June,July,August,September,October,November,December],
            // ⑦dataset의 배경색(rgba값을 String으로 표현)
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            // ⑧dataset의 선 색(rgba값을 String으로 표현)
            borderColor: 'rgba(255, 99, 132, 1)',
            // ⑨dataset의 선 두께(Number)
            borderWidth: 2
        }]
    },
    // ⑩차트의 설정(Object)
    options: {
        // ⑪축에 관한 설정(Object)
        scales: {
            // ⑫y축에 대한 설정(Object)
            y: {
                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                suggestedMax: 7,
                beginAtZero: true
            }
        } 
    }
});