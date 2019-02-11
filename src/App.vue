<template>
  <div id="app">
    <h1>Try GitHub Actions</h1>
    <p>
      This project is a demonstration of a CI/CD pipeline with GitHub Actions. 
      Hosted on <a href="https://heroku.com">Heroku</a>
    </p>
    <p>If you would like to get more information about this project make sure to check out the links below</p>
    <a href="https://github.com/pedsm/tryGithubAction">GitHub repo</a>
    <!--  TODO: Update this    -->
    <br/>
    <a href="#">Blog Post(coming soon)</a>

    <h2>Contributors</h2>
    <div id="userContainer"> 
      <user v-for="user in users" :key="user" :username="user"/>
    </div>
  </div>
</template>

<script>
import User from './components/User.vue'
import users from './users.json'

export default {
  name: 'tryGithubAction',
  components: {
    User
  },
  data: () => ({
    users
  })
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

#userContainer {
  display: flex;
  flex-wrap: wrap;
  width: 50%;
  margin: auto;
  justify-content: center;
}
a {
  color: #58CCED;
}

a:hover {
  color: #1261AD;
}
</style>
