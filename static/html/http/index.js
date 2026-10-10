async function fetchHero() {
  const resp = await fetch('https://study.duyiedu.com/api/herolist'); // When this line finished, just got response header
  console.log(resp.body);
  const body = await resp.blob(); // Therefore we need wait for response body
  console.log(body);
}

fetchHero();
