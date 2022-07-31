const twenty = document.getElementById('twenty').innerText;
const thirty = document.getElementById('thirty').innerText;
const forty = document.getElementById('forty').innerText;
const fifty = document.getElementById('fifty').innerText;
const sixty = document.getElementById('sixty').innerText;

//차트를 그럴 영역을 dom요소로 가져온다.
var chartArea2 = document.getElementById('ageChart').getContext('2d');
// 차트를 생성한다. 
var myChart2 = new Chart(chartArea2, {
    // ①차트의 종류(String)
    type: 'doughnut',
    // ②차트의 데이터(Object)
    data: {
        // ③x축에 들어갈 이름들(Array)
        labels: ['20대 이하','30대','40대','50대','60대 이상'],
        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
        datasets: [{
            // ⑤dataset의 이름(String)
            label: '총 조회수',
            // ⑥dataset값(Array)
            data: [twenty,thirty,forty,fifty,sixty],
            // ⑦dataset의 배경색(rgba값을 String으로 표현)
            backgroundColor: ['#9ACD32','#87CEEB','#7FFFD4','#EE82EE','#FFC0CB'],
            // ⑧dataset의 선 색(rgba값을 String으로 표현)
            borderColor: '#fff',
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