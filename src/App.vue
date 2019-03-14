<template>
  <div id="app">
    <h1>Try GitHub Actions</h1>
    <p>
      This project is a demonstration of a CI/CD pipeline with GitHub Actions. 
      Hosted on <a href="https://heroku.com">Heroku</a>
    </p>
    <p>If you would like to get more information about this project make sure to check out the links below</p>
    <a href="https://medium.freecodecamp.org/a-first-look-at-github-actions-with-heroku-a6b4239d556">A first look at GitHub Actions with Heroku</a>

    <h2>Contributors</h2>
    <a href="https://github.com/pedsm/tryGithubActions">Join the list</a>
    <div id="userContainer"> 
      <user v-for="user in users" :key="user" :username="user"/>
    </div>
    <a href="https://github.com/pedsm/tryGithubActions">
      <i class="fa-3x fab fa-github"></i>
    </a>
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
