import React from 'react'
import { NavLink } from 'react-router-dom'

import './headerButton.css'

const HeaderButton = (props) => {
	return(
		<NavLink
			exact to={props.link}
			name={props.buttonName}
			interaction='click'
			className='default_header_link'
			onClick={props.onClick}
		>
			{props.children}
		</NavLink>
	)
}

export default HeaderButton