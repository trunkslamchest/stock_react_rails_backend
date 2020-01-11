import React from 'react'
import { NavLink } from 'react-router-dom'

import './css/Home.css'

export default class Home extends React.Component {

	componentDidMount(){
		this.onPageLoadFunctions()
	}

	onClickLogInFunctions = (event) => {
		this.onClickUpdateTrafficFunctions(event)
	}

	onClickSignUpFunctions = (event) => {
		this.onClickUpdateTrafficFunctions(event)
	}

	onClickUpdateTrafficFunctions = (event) => {
		this.props.update_traffic_data({
			user_id: this.props.user_id,
			interaction: event.target.attributes.interaction.value,
			element: event.target.name
		})
	}

	onPageLoadFunctions = () => {
		this.props.update_page_data({
			user_id: localStorage.user_id,
			page_name: "index",
		})
	}

	render(){

		const logged_in_home = <>
			<h3>Index Template</h3>
		</>


		const log_in_button = [
			<NavLink
				exact to="/log_in"
				key={"log_in_link"}
				name="log_in_button"
				interaction="click"
				className="log_in_button"
				onClick={this.onClickLogInFunctions }
			>
				Log In
			</NavLink>
		]

		const sign_up_button = [
			<NavLink
				exact to="/sign_up"
				key={"sign_up_link"}
				name="sign_up_button"
				interaction="click"
				className="sign_up_button"
				onClick={this.onClickLogInFunctions }
			>
				Sign Up
			</NavLink>
		]

		const logged_out_home = <>
			<div className="log_in_sign_up_container">
				{ log_in_button }
				{ sign_up_button }
			</div>
		</>

		return(
			<div className="default_wrapper">
				{ localStorage.length === 0 ? logged_out_home : logged_in_home }
			</div>
		)
	}
}