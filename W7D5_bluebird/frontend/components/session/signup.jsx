import React from "react";

class Signup extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      // info needed to creste new user
      username: "",
      email: "",
      password: ""
    };

    // handleSubmit not bound to current scope of instance of signup form
    // need to bind
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(type) {
    // returns an event handler function
    return event => {
      this.setState({ [type]: event.target.value });
    };
  }

  // handleSubmit is an event handler function
  handleSubmit(event) {
    event.preventDefault();
    this.props
      .createNewUser(this.state)
      .then(() => this.props.history.push("/chirps"));
    // on success ^ callback function to redirect to -> chirps page
    // (whatever page you want to send them to)
  }

  render() {
    return (
      <div className="session-form">
        <h2>Sign up!</h2>
        <form>
          <label>
            Username:
            <input
              type="text"
              value={this.state.username}
              onChange={this.handleInput("username")}
            />
          </label>
          <label>
            Email:
            <input
              type="text"
              value={this.state.email}
              onChange={this.handleInput("email")}
            />
          </label>
          <label>
            Password:
            <input
              type="password"
              value={this.state.password}
              onChange={this.handleInput("password")}
            />
          </label>
          <button onClick={this.handleSubmit}>Sign Up</button>
        </form>
      </div>
    );
    // onClick gets passed in a function-> on submission of form //
    //->carry out function // onClick will pass in event(argument) to
    //this.handleSubmit // and invokes it with the argument/event}
  }
}

export default Signup;
