﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/ExternalMaster.Master" AutoEventWireup="true" CodeBehind="PackagePricing.aspx.cs" Inherits="VirtualBazaar.PackagePricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /*!
 * pricing.css (https://github.com/abhimaliyeckal)
 * Version: 1.0
 * Author: Abhishek Raj 
 * Linkedin URL: https://in.linkedin.com/in/abhimaliyeckal
 * Github: https://github.com/abhimaliyeckal

 * Made available under a MIT License:
 * http://www.opensource.org/licenses/mit-license.php

 * pricing.css Copyright Abhishek Raj 2014.
 */

        @import url(http://fonts.googleapis.com/css?family=Open+Sans:300);

        body {
            background: #010101;
        }

        .price_table_container {
            text-align: center;
            color: #666;
            margin-top: 35px;
            font-family: 'Open Sans', sans-serif;
        }

        .price_table_heading {
            font-size: 36px;
            padding: 10px;
            background: #EEE;
        }


        .price_table_row {
            padding: 15px;
            background: #FFF;
        }

        .cost {
            padding: 30px;
            font-size: 30px;
        }

            .cost span {
                font-size: 15px;
            }

        .price_table_row:nth-of-type(even) {
            background: #F8F8F8;
        }

        .btn {
            border-radius: 0px;
        }

        .recommended {
            /*USER DEFINED COLOUR*/
            background: #FF3A3A;
            color: #FFF;
            /*USER DEFINED COLOUR*/
            padding: 3px 0 3px 0;
            margin-top: 10px;
            text-align: center;
            margin-bottom: -35px;
            font-family: 'Open Sans', sans-serif;
        }


        .spacer {
            width: 100%;
            height: 50px;
        }


        /*Already Defined Colours*/
        /*Background*/
        .primary-bg {
            background: #337AB7;
            color: #FFF;
        }

        .success-bg {
            background: #5CB85C;
            color: #FFF;
        }

        .info-bg {
            background: #5BC0DE;
            color: #FFF;
        }

        .warning-bg {
            background: #F0AD4E;
            color: #FFF;
        }

        .danger-bg {
            background: #D9534F;
            color: #FFF;
        }

        .dark-bg {
            background: #444;
            color: #FFF;
        }

        .royal-bg {
            background: #8E74E2;
            color: #FFF;
        }

        .static-bg {
            background: #2BB0A6;
            color: #FFF;
        }

        /*Only Text Colours*/
        .primary-text {
            background: #FFF;
            color: #337AB7;
        }

        .success-text {
            background: #FFF;
            color: #5CB85C;
        }

        .info-text {
            background: #FFF;
            color: #5BC0DE;
        }

        .warning-text {
            background: #FFF;
            color: #F0AD4E;
        }

        .danger-text {
            background: #FFF;
            color: #D9534F;
        }

        .dark-text {
            background: #FFF;
            color: #444;
        }

        .royal-text {
            background: #FFF;
            color: #8E74E2;
        }

        .static-text {
            background: #FFF;
            color: #2BB0A6;
        }

        /*Additional Button styles*/

        /*BTN-DARK*/
        .btn-dark {
            color: #fff;
            background-color: #444;
            border-color: #444;
        }

            .btn-dark:hover,
            .btn-dark:focus,
            .btn-dark.focus,
            .btn-dark:active,
            .btn-dark.active,
            .open > .dropdown-toggle.btn-dark {
                color: #fff;
                background-color: #222;
                border-color: #222;
            }

            .btn-dark:active,
            .btn-dark.active,
            .open > .dropdown-toggle.btn-dark {
                background-image: none;
            }


        /*BTN-ROYAL---------*/
        .btn-royal {
            color: #fff;
            background-color: #8E74E2;
            border-color: #8E74E2;
        }

            .btn-royal:hover,
            .btn-royal:focus,
            .btn-royal.focus,
            .btn-royal:active,
            .btn-royal.active,
            .open > .dropdown-toggle.btn-royal {
                color: #fff;
                background-color: #7451E8;
                border-color: #7451E8;
            }

            .btn-royal:active,
            .btn-royal.active,
            .open > .dropdown-toggle.btn-royal {
                background-image: none;
            }


        /*BTN-STATIC---------*/
        .btn-static {
            color: #fff;
            background-color: #2BB0A6;
            border-color: #2BB0A6;
        }

            .btn-static:hover,
            .btn-static:focus,
            .btn-static.focus,
            .btn-static:active,
            .btn-static.active,
            .open > .dropdown-toggle.btn-static {
                color: #fff;
                background-color: #07A094;
                border-color: #07A094;
            }

            .btn-static:active,
            .btn-static.active,
            .open > .dropdown-toggle.btn-static {
                background-image: none;
            }











        /*!
 * Hover.css (http://ianlunn.co.uk/)
 * Version: 1.0.10
 * Author: Ian Lunn @IanLunn
 * Author URL: http://ianlunn.co.uk/
 * Github: https://github.com/IanLunn/Hover

 * Made available under a MIT License:
 * http://www.opensource.org/licenses/mit-license.php

 * Hover.css Copyright Ian Lunn 2014.
 */ .button {
            margin: .4em;
            padding: 1em;
            cursor: pointer;
            background: #e1e1e1;
            text-decoration: none;
            color: #666;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
        }

        .grow {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .grow:active, .grow:focus, .grow:hover {
                -webkit-transform: scale(1.1);
                transform: scale(1.1);
            }

        .shrink {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .shrink:active, .shrink:focus, .shrink:hover {
                -webkit-transform: scale(0.9);
                transform: scale(0.9);
            }

        @-webkit-keyframes pulse {
            25% {
                -webkit-transform: scale(1.1);
                transform: scale(1.1);
            }

            75% {
                -webkit-transform: scale(0.9);
                transform: scale(0.9);
            }
        }

        @keyframes pulse {
            25% {
                -webkit-transform: scale(1.1);
                transform: scale(1.1);
            }

            75% {
                -webkit-transform: scale(0.9);
                transform: scale(0.9);
            }
        }

        .pulse {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .pulse:active, .pulse:focus, .pulse:hover {
                -webkit-animation-name: pulse;
                animation-name: pulse;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
            }

        @-webkit-keyframes pulse-grow {
            to {
                -webkit-transform: scale(1.1);
                transform: scale(1.1);
            }
        }

        @keyframes pulse-grow {
            to {
                -webkit-transform: scale(1.1);
                transform: scale(1.1);
            }
        }

        .pulse-grow {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .pulse-grow:active, .pulse-grow:focus, .pulse-grow:hover {
                -webkit-animation-name: pulse-grow;
                animation-name: pulse-grow;
                -webkit-animation-duration: .3s;
                animation-duration: .3s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
                -webkit-animation-direction: alternate;
                animation-direction: alternate;
            }

        @-webkit-keyframes pulse-shrink {
            to {
                -webkit-transform: scale(0.9);
                transform: scale(0.9);
            }
        }

        @keyframes pulse-shrink {
            to {
                -webkit-transform: scale(0.9);
                transform: scale(0.9);
            }
        }

        .pulse-shrink {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .pulse-shrink:active, .pulse-shrink:focus, .pulse-shrink:hover {
                -webkit-animation-name: pulse-shrink;
                animation-name: pulse-shrink;
                -webkit-animation-duration: .3s;
                animation-duration: .3s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
                -webkit-animation-direction: alternate;
                animation-direction: alternate;
            }

        @-webkit-keyframes push {
            50% {
                -webkit-transform: scale(0.8);
                transform: scale(0.8);
            }

            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        @keyframes push {
            50% {
                -webkit-transform: scale(0.8);
                transform: scale(0.8);
            }

            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        .push {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .push:active, .push:focus, .push:hover {
                -webkit-animation-name: push;
                animation-name: push;
                -webkit-animation-duration: .3s;
                animation-duration: .3s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        @-webkit-keyframes pop {
            50% {
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }

            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        @keyframes pop {
            50% {
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }

            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        .pop {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .pop:active, .pop:focus, .pop:hover {
                -webkit-animation-name: pop;
                animation-name: pop;
                -webkit-animation-duration: .3s;
                animation-duration: .3s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        .rotate {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .rotate:active, .rotate:focus, .rotate:hover {
                -webkit-transform: rotate(4deg);
                transform: rotate(4deg);
            }

        .grow-rotate {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .grow-rotate:active, .grow-rotate:focus, .grow-rotate:hover {
                -webkit-transform: scale(1.1) rotate(4deg);
                transform: scale(1.1) rotate(4deg);
            }

        .float {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .float:active, .float:focus, .float:hover {
                -webkit-transform: translateY(-5px);
                transform: translateY(-5px);
            }

        .sink {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .sink:active, .sink:focus, .sink:hover {
                -webkit-transform: translateY(5px);
                transform: translateY(5px);
            }

        @-webkit-keyframes hover {
            50% {
                -webkit-transform: translateY(-3px);
                transform: translateY(-3px);
            }

            100% {
                -webkit-transform: translateY(-6px);
                transform: translateY(-6px);
            }
        }

        @keyframes hover {
            50% {
                -webkit-transform: translateY(-3px);
                transform: translateY(-3px);
            }

            100% {
                -webkit-transform: translateY(-6px);
                transform: translateY(-6px);
            }
        }

        .hover {
            display: inline-block;
            -webkit-transition-duration: .5s;
            transition-duration: .5s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .hover:active, .hover:focus, .hover:hover {
                -webkit-transform: translateY(-6px);
                transform: translateY(-6px);
                -webkit-animation-name: hover;
                animation-name: hover;
                -webkit-animation-duration: 1.5s;
                animation-duration: 1.5s;
                -webkit-animation-delay: .3s;
                animation-delay: .3s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
                -webkit-animation-direction: alternate;
                animation-direction: alternate;
            }

        @-webkit-keyframes hang {
            50% {
                -webkit-transform: translateY(3px);
                transform: translateY(3px);
            }

            100% {
                -webkit-transform: translateY(6px);
                transform: translateY(6px);
            }
        }

        @keyframes hang {
            50% {
                -webkit-transform: translateY(3px);
                transform: translateY(3px);
            }

            100% {
                -webkit-transform: translateY(6px);
                transform: translateY(6px);
            }
        }

        .hang {
            display: inline-block;
            -webkit-transition-duration: .5s;
            transition-duration: .5s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .hang:active, .hang:focus, .hang:hover {
                -webkit-transform: translateY(6px);
                transform: translateY(6px);
                -webkit-animation-name: hang;
                animation-name: hang;
                -webkit-animation-duration: 1.5s;
                animation-duration: 1.5s;
                -webkit-animation-delay: .3s;
                animation-delay: .3s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
                -webkit-animation-direction: alternate;
                animation-direction: alternate;
            }

        .skew {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .skew:active, .skew:focus, .skew:hover {
                -webkit-transform: skew(-10deg);
                transform: skew(-10deg);
            }

        .skew-forward {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform-origin: 0 100%;
            transform-origin: 0 100%;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .skew-forward:active, .skew-forward:focus, .skew-forward:hover {
                -webkit-transform: skew(-10deg);
                transform: skew(-10deg);
            }

        .skew-backward {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform-origin: 0 100%;
            transform-origin: 0 100%;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .skew-backward:active, .skew-backward:focus, .skew-backward:hover {
                -webkit-transform: skew(10deg);
                transform: skew(10deg);
            }

        @-webkit-keyframes wobble-vertical {
            16.65% {
                -webkit-transform: translateY(8px);
                transform: translateY(8px);
            }

            33.3% {
                -webkit-transform: translateY(-6px);
                transform: translateY(-6px);
            }

            49.95% {
                -webkit-transform: translateY(4px);
                transform: translateY(4px);
            }

            66.6% {
                -webkit-transform: translateY(-2px);
                transform: translateY(-2px);
            }

            83.25% {
                -webkit-transform: translateY(1px);
                transform: translateY(1px);
            }

            100% {
                -webkit-transform: translateY(0);
                transform: translateY(0);
            }
        }

        @keyframes wobble-vertical {
            16.65% {
                -webkit-transform: translateY(8px);
                transform: translateY(8px);
            }

            33.3% {
                -webkit-transform: translateY(-6px);
                transform: translateY(-6px);
            }

            49.95% {
                -webkit-transform: translateY(4px);
                transform: translateY(4px);
            }

            66.6% {
                -webkit-transform: translateY(-2px);
                transform: translateY(-2px);
            }

            83.25% {
                -webkit-transform: translateY(1px);
                transform: translateY(1px);
            }

            100% {
                -webkit-transform: translateY(0);
                transform: translateY(0);
            }
        }

        .wobble-vertical {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .wobble-vertical:active, .wobble-vertical:focus, .wobble-vertical:hover {
                -webkit-animation-name: wobble-vertical;
                animation-name: wobble-vertical;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-timing-function: ease-in-out;
                animation-timing-function: ease-in-out;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        @-webkit-keyframes wobble-horizontal {
            16.65% {
                -webkit-transform: translateX(8px);
                transform: translateX(8px);
            }

            33.3% {
                -webkit-transform: translateX(-6px);
                transform: translateX(-6px);
            }

            49.95% {
                -webkit-transform: translateX(4px);
                transform: translateX(4px);
            }

            66.6% {
                -webkit-transform: translateX(-2px);
                transform: translateX(-2px);
            }

            83.25% {
                -webkit-transform: translateX(1px);
                transform: translateX(1px);
            }

            100% {
                -webkit-transform: translateX(0);
                transform: translateX(0);
            }
        }

        @keyframes wobble-horizontal {
            16.65% {
                -webkit-transform: translateX(8px);
                transform: translateX(8px);
            }

            33.3% {
                -webkit-transform: translateX(-6px);
                transform: translateX(-6px);
            }

            49.95% {
                -webkit-transform: translateX(4px);
                transform: translateX(4px);
            }

            66.6% {
                -webkit-transform: translateX(-2px);
                transform: translateX(-2px);
            }

            83.25% {
                -webkit-transform: translateX(1px);
                transform: translateX(1px);
            }

            100% {
                -webkit-transform: translateX(0);
                transform: translateX(0);
            }
        }

        .wobble-horizontal {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .wobble-horizontal:active, .wobble-horizontal:focus, .wobble-horizontal:hover {
                -webkit-animation-name: wobble-horizontal;
                animation-name: wobble-horizontal;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-timing-function: ease-in-out;
                animation-timing-function: ease-in-out;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        @-webkit-keyframes wobble-to-bottom-right {
            16.65% {
                -webkit-transform: translate(8px,8px);
                transform: translate(8px,8px);
            }

            33.3% {
                -webkit-transform: translate(-6px,-6px);
                transform: translate(-6px,-6px);
            }

            49.95% {
                -webkit-transform: translate(4px,4px);
                transform: translate(4px,4px);
            }

            66.6% {
                -webkit-transform: translate(-2px,-2px);
                transform: translate(-2px,-2px);
            }

            83.25% {
                -webkit-transform: translate(1px,1px);
                transform: translate(1px,1px);
            }

            100% {
                -webkit-transform: translate(0,0);
                transform: translate(0,0);
            }
        }

        @keyframes wobble-to-bottom-right {
            16.65% {
                -webkit-transform: translate(8px,8px);
                transform: translate(8px,8px);
            }

            33.3% {
                -webkit-transform: translate(-6px,-6px);
                transform: translate(-6px,-6px);
            }

            49.95% {
                -webkit-transform: translate(4px,4px);
                transform: translate(4px,4px);
            }

            66.6% {
                -webkit-transform: translate(-2px,-2px);
                transform: translate(-2px,-2px);
            }

            83.25% {
                -webkit-transform: translate(1px,1px);
                transform: translate(1px,1px);
            }

            100% {
                -webkit-transform: translate(0,0);
                transform: translate(0,0);
            }
        }

        .wobble-to-bottom-right {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .wobble-to-bottom-right:active, .wobble-to-bottom-right:focus, .wobble-to-bottom-right:hover {
                -webkit-animation-name: wobble-to-bottom-right;
                animation-name: wobble-to-bottom-right;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-timing-function: ease-in-out;
                animation-timing-function: ease-in-out;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        @-webkit-keyframes wobble-to-top-right {
            16.65% {
                -webkit-transform: translate(8px,-8px);
                transform: translate(8px,-8px);
            }

            33.3% {
                -webkit-transform: translate(-6px,6px);
                transform: translate(-6px,6px);
            }

            49.95% {
                -webkit-transform: translate(4px,-4px);
                transform: translate(4px,-4px);
            }

            66.6% {
                -webkit-transform: translate(-2px,2px);
                transform: translate(-2px,2px);
            }

            83.25% {
                -webkit-transform: translate(1px,-1px);
                transform: translate(1px,-1px);
            }

            100% {
                -webkit-transform: translate(0,0);
                transform: translate(0,0);
            }
        }

        @keyframes wobble-to-top-right {
            16.65% {
                -webkit-transform: translate(8px,-8px);
                transform: translate(8px,-8px);
            }

            33.3% {
                -webkit-transform: translate(-6px,6px);
                transform: translate(-6px,6px);
            }

            49.95% {
                -webkit-transform: translate(4px,-4px);
                transform: translate(4px,-4px);
            }

            66.6% {
                -webkit-transform: translate(-2px,2px);
                transform: translate(-2px,2px);
            }

            83.25% {
                -webkit-transform: translate(1px,-1px);
                transform: translate(1px,-1px);
            }

            100% {
                -webkit-transform: translate(0,0);
                transform: translate(0,0);
            }
        }

        .wobble-to-top-right {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .wobble-to-top-right:active, .wobble-to-top-right:focus, .wobble-to-top-right:hover {
                -webkit-animation-name: wobble-to-top-right;
                animation-name: wobble-to-top-right;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-timing-function: ease-in-out;
                animation-timing-function: ease-in-out;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        @-webkit-keyframes wobble-top {
            16.65% {
                -webkit-transform: skew(-12deg);
                transform: skew(-12deg);
            }

            33.3% {
                -webkit-transform: skew(10deg);
                transform: skew(10deg);
            }

            49.95% {
                -webkit-transform: skew(-6deg);
                transform: skew(-6deg);
            }

            66.6% {
                -webkit-transform: skew(4deg);
                transform: skew(4deg);
            }

            83.25% {
                -webkit-transform: skew(-2deg);
                transform: skew(-2deg);
            }

            100% {
                -webkit-transform: skew(0);
                transform: skew(0);
            }
        }

        @keyframes wobble-top {
            16.65% {
                -webkit-transform: skew(-12deg);
                transform: skew(-12deg);
            }

            33.3% {
                -webkit-transform: skew(10deg);
                transform: skew(10deg);
            }

            49.95% {
                -webkit-transform: skew(-6deg);
                transform: skew(-6deg);
            }

            66.6% {
                -webkit-transform: skew(4deg);
                transform: skew(4deg);
            }

            83.25% {
                -webkit-transform: skew(-2deg);
                transform: skew(-2deg);
            }

            100% {
                -webkit-transform: skew(0);
                transform: skew(0);
            }
        }

        .wobble-top {
            display: inline-block;
            -webkit-transform-origin: 0 100%;
            transform-origin: 0 100%;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .wobble-top:active, .wobble-top:focus, .wobble-top:hover {
                -webkit-animation-name: wobble-top;
                animation-name: wobble-top;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-timing-function: ease-in-out;
                animation-timing-function: ease-in-out;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        @-webkit-keyframes wobble-bottom {
            16.65% {
                -webkit-transform: skew(-12deg);
                transform: skew(-12deg);
            }

            33.3% {
                -webkit-transform: skew(10deg);
                transform: skew(10deg);
            }

            49.95% {
                -webkit-transform: skew(-6deg);
                transform: skew(-6deg);
            }

            66.6% {
                -webkit-transform: skew(4deg);
                transform: skew(4deg);
            }

            83.25% {
                -webkit-transform: skew(-2deg);
                transform: skew(-2deg);
            }

            100% {
                -webkit-transform: skew(0);
                transform: skew(0);
            }
        }

        @keyframes wobble-bottom {
            16.65% {
                -webkit-transform: skew(-12deg);
                transform: skew(-12deg);
            }

            33.3% {
                -webkit-transform: skew(10deg);
                transform: skew(10deg);
            }

            49.95% {
                -webkit-transform: skew(-6deg);
                transform: skew(-6deg);
            }

            66.6% {
                -webkit-transform: skew(4deg);
                transform: skew(4deg);
            }

            83.25% {
                -webkit-transform: skew(-2deg);
                transform: skew(-2deg);
            }

            100% {
                -webkit-transform: skew(0);
                transform: skew(0);
            }
        }

        .wobble-bottom {
            display: inline-block;
            -webkit-transform-origin: 100% 0;
            transform-origin: 100% 0;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .wobble-bottom:active, .wobble-bottom:focus, .wobble-bottom:hover {
                -webkit-animation-name: wobble-bottom;
                animation-name: wobble-bottom;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-timing-function: ease-in-out;
                animation-timing-function: ease-in-out;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        @-webkit-keyframes wobble-skew {
            16.65% {
                -webkit-transform: skew(-12deg);
                transform: skew(-12deg);
            }

            33.3% {
                -webkit-transform: skew(10deg);
                transform: skew(10deg);
            }

            49.95% {
                -webkit-transform: skew(-6deg);
                transform: skew(-6deg);
            }

            66.6% {
                -webkit-transform: skew(4deg);
                transform: skew(4deg);
            }

            83.25% {
                -webkit-transform: skew(-2deg);
                transform: skew(-2deg);
            }

            100% {
                -webkit-transform: skew(0);
                transform: skew(0);
            }
        }

        @keyframes wobble-skew {
            16.65% {
                -webkit-transform: skew(-12deg);
                transform: skew(-12deg);
            }

            33.3% {
                -webkit-transform: skew(10deg);
                transform: skew(10deg);
            }

            49.95% {
                -webkit-transform: skew(-6deg);
                transform: skew(-6deg);
            }

            66.6% {
                -webkit-transform: skew(4deg);
                transform: skew(4deg);
            }

            83.25% {
                -webkit-transform: skew(-2deg);
                transform: skew(-2deg);
            }

            100% {
                -webkit-transform: skew(0);
                transform: skew(0);
            }
        }

        .wobble-skew {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .wobble-skew:active, .wobble-skew:focus, .wobble-skew:hover {
                -webkit-animation-name: wobble-skew;
                animation-name: wobble-skew;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-timing-function: ease-in-out;
                animation-timing-function: ease-in-out;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        @-webkit-keyframes buzz {
            50% {
                -webkit-transform: translateX(3px) rotate(2deg);
                transform: translateX(3px) rotate(2deg);
            }

            100% {
                -webkit-transform: translateX(-3px) rotate(-2deg);
                transform: translateX(-3px) rotate(-2deg);
            }
        }

        @keyframes buzz {
            50% {
                -webkit-transform: translateX(3px) rotate(2deg);
                transform: translateX(3px) rotate(2deg);
            }

            100% {
                -webkit-transform: translateX(-3px) rotate(-2deg);
                transform: translateX(-3px) rotate(-2deg);
            }
        }

        .buzz {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .buzz:active, .buzz:focus, .buzz:hover {
                -webkit-animation-name: buzz;
                animation-name: buzz;
                -webkit-animation-duration: .15s;
                animation-duration: .15s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
            }

        @-webkit-keyframes buzz-out {
            10% {
                -webkit-transform: translateX(3px) rotate(2deg);
                transform: translateX(3px) rotate(2deg);
            }

            20% {
                -webkit-transform: translateX(-3px) rotate(-2deg);
                transform: translateX(-3px) rotate(-2deg);
            }

            30% {
                -webkit-transform: translateX(3px) rotate(2deg);
                transform: translateX(3px) rotate(2deg);
            }

            40% {
                -webkit-transform: translateX(-3px) rotate(-2deg);
                transform: translateX(-3px) rotate(-2deg);
            }

            50% {
                -webkit-transform: translateX(2px) rotate(1deg);
                transform: translateX(2px) rotate(1deg);
            }

            60% {
                -webkit-transform: translateX(-2px) rotate(-1deg);
                transform: translateX(-2px) rotate(-1deg);
            }

            70% {
                -webkit-transform: translateX(2px) rotate(1deg);
                transform: translateX(2px) rotate(1deg);
            }

            80% {
                -webkit-transform: translateX(-2px) rotate(-1deg);
                transform: translateX(-2px) rotate(-1deg);
            }

            90% {
                -webkit-transform: translateX(1px) rotate(0);
                transform: translateX(1px) rotate(0);
            }

            100% {
                -webkit-transform: translateX(-1px) rotate(0);
                transform: translateX(-1px) rotate(0);
            }
        }

        @keyframes buzz-out {
            10% {
                -webkit-transform: translateX(3px) rotate(2deg);
                transform: translateX(3px) rotate(2deg);
            }

            20% {
                -webkit-transform: translateX(-3px) rotate(-2deg);
                transform: translateX(-3px) rotate(-2deg);
            }

            30% {
                -webkit-transform: translateX(3px) rotate(2deg);
                transform: translateX(3px) rotate(2deg);
            }

            40% {
                -webkit-transform: translateX(-3px) rotate(-2deg);
                transform: translateX(-3px) rotate(-2deg);
            }

            50% {
                -webkit-transform: translateX(2px) rotate(1deg);
                transform: translateX(2px) rotate(1deg);
            }

            60% {
                -webkit-transform: translateX(-2px) rotate(-1deg);
                transform: translateX(-2px) rotate(-1deg);
            }

            70% {
                -webkit-transform: translateX(2px) rotate(1deg);
                transform: translateX(2px) rotate(1deg);
            }

            80% {
                -webkit-transform: translateX(-2px) rotate(-1deg);
                transform: translateX(-2px) rotate(-1deg);
            }

            90% {
                -webkit-transform: translateX(1px) rotate(0);
                transform: translateX(1px) rotate(0);
            }

            100% {
                -webkit-transform: translateX(-1px) rotate(0);
                transform: translateX(-1px) rotate(0);
            }
        }

        .buzz-out {
            display: inline-block;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .buzz-out:active, .buzz-out:focus, .buzz-out:hover {
                -webkit-animation-name: buzz-out;
                animation-name: buzz-out;
                -webkit-animation-duration: .75s;
                animation-duration: .75s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: 1;
                animation-iteration-count: 1;
            }

        .border-fade {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: box-shadow;
            transition-property: box-shadow;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: inset 0 0 0 4px #e1e1e1,0 0 1px rgba(0,0,0,0);
        }

            .border-fade:active, .border-fade:focus, .border-fade:hover {
                box-shadow: inset 0 0 0 4px #666,0 0 1px rgba(0,0,0,0);
            }

        .hollow {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: background;
            transition-property: background;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: inset 0 0 0 4px #e1e1e1,0 0 1px rgba(0,0,0,0);
        }

            .hollow:active, .hollow:focus, .hollow:hover {
                background: 0 0;
            }

        .trim {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .trim:before {
                content: '';
                position: absolute;
                border: #fff solid 4px;
                top: 4px;
                left: 4px;
                right: 4px;
                bottom: 4px;
                opacity: 0;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: opacity;
                transition-property: opacity;
            }

            .trim:active:before, .trim:focus:before, .trim:hover:before {
                opacity: 1;
            }

        .outline-outward {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .outline-outward:before {
                content: '';
                position: absolute;
                border: #e1e1e1 solid 4px;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: top,right,bottom,left;
                transition-property: top,right,bottom,left;
            }

            .outline-outward:active:before, .outline-outward:focus:before, .outline-outward:hover:before {
                top: -8px;
                right: -8px;
                bottom: -8px;
                left: -8px;
            }

        .outline-inward {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .outline-inward:before {
                pointer-events: none;
                content: '';
                position: absolute;
                border: #e1e1e1 solid 4px;
                top: -16px;
                right: -16px;
                bottom: -16px;
                left: -16px;
                opacity: 0;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: top,right,bottom,left;
                transition-property: top,right,bottom,left;
            }

            .outline-inward:active:before, .outline-inward:focus:before, .outline-inward:hover:before {
                top: -8px;
                right: -8px;
                bottom: -8px;
                left: -8px;
                opacity: 1;
            }

        .round-corners {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: border-radius;
            transition-property: border-radius;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .round-corners:active, .round-corners:focus, .round-corners:hover {
                border-radius: 1em;
            }

        .glow {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: box-shadow;
            transition-property: box-shadow;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .glow:active, .glow:focus, .glow:hover {
                box-shadow: 0 0 8px rgba(0,0,0,.6);
            }

        .box-shadow-outset {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: box-shadow;
            transition-property: box-shadow;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .box-shadow-outset:active, .box-shadow-outset:focus, .box-shadow-outset:hover {
                box-shadow: 2px 2px 2px rgba(0,0,0,.6);
            }

        .box-shadow-inset {
            display: inline-block;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: box-shadow;
            transition-property: box-shadow;
            box-shadow: inset 0 0 0 rgba(0,0,0,.6),0 0 1px rgba(0,0,0,0);
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
        }

            .box-shadow-inset:active, .box-shadow-inset:focus, .box-shadow-inset:hover {
                box-shadow: inset 2px 2px 2px rgba(0,0,0,.6),0 0 1px rgba(0,0,0,0);
            }

        .float-shadow {
            display: inline-block;
            position: relative;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .float-shadow:before {
                pointer-events: none;
                position: absolute;
                z-index: -1;
                content: '';
                top: 100%;
                left: 5%;
                height: 10px;
                width: 90%;
                opacity: 0;
                background: -webkit-radial-gradient(center,ellipse,rgba(0,0,0,.35) 0,rgba(0,0,0,0) 80%);
                background: radial-gradient(ellipse at center,rgba(0,0,0,.35) 0,rgba(0,0,0,0) 80%);
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: transform,opacity;
                transition-property: transform,opacity;
            }

            .float-shadow:active, .float-shadow:focus, .float-shadow:hover {
                -webkit-transform: translateY(-5px);
                transform: translateY(-5px);
            }

                .float-shadow:active:before, .float-shadow:focus:before, .float-shadow:hover:before {
                    opacity: 1;
                    -webkit-transform: translateY(5px);
                    transform: translateY(5px);
                }

        @-webkit-keyframes hover {
            50% {
                -webkit-transform: translateY(-3px);
                transform: translateY(-3px);
            }

            100% {
                -webkit-transform: translateY(-6px);
                transform: translateY(-6px);
            }
        }

        @keyframes hover {
            50% {
                -webkit-transform: translateY(-3px);
                transform: translateY(-3px);
            }

            100% {
                -webkit-transform: translateY(-6px);
                transform: translateY(-6px);
            }
        }

        @-webkit-keyframes hover-shadow {
            0% {
                -webkit-transform: translateY(6px);
                transform: translateY(6px);
                opacity: .4;
            }

            50% {
                -webkit-transform: translateY(3px);
                transform: translateY(3px);
                opacity: 1;
            }

            100% {
                -webkit-transform: translateY(6px);
                transform: translateY(6px);
                opacity: .4;
            }
        }

        @keyframes hover-shadow {
            0% {
                -webkit-transform: translateY(6px);
                transform: translateY(6px);
                opacity: .4;
            }

            50% {
                -webkit-transform: translateY(3px);
                transform: translateY(3px);
                opacity: 1;
            }

            100% {
                -webkit-transform: translateY(6px);
                transform: translateY(6px);
                opacity: .4;
            }
        }

        .hover-shadow {
            display: inline-block;
            position: relative;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .hover-shadow:before {
                pointer-events: none;
                position: absolute;
                z-index: -1;
                content: '';
                top: 100%;
                left: 5%;
                height: 10px;
                width: 90%;
                opacity: 0;
                background: -webkit-radial-gradient(center,ellipse,rgba(0,0,0,.35) 0,rgba(0,0,0,0) 80%);
                background: radial-gradient(ellipse at center,rgba(0,0,0,.35) 0,rgba(0,0,0,0) 80%);
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: transform,opacity;
                transition-property: transform,opacity;
            }

            .hover-shadow:active, .hover-shadow:focus, .hover-shadow:hover {
                -webkit-transform: translateY(-6px);
                transform: translateY(-6px);
                -webkit-animation-name: hover;
                animation-name: hover;
                -webkit-animation-duration: 1.5s;
                animation-duration: 1.5s;
                -webkit-animation-delay: .3s;
                animation-delay: .3s;
                -webkit-animation-timing-function: linear;
                animation-timing-function: linear;
                -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
                -webkit-animation-direction: alternate;
                animation-direction: alternate;
            }

                .hover-shadow:active:before, .hover-shadow:focus:before, .hover-shadow:hover:before {
                    opacity: .4;
                    -webkit-transform: translateY(6px);
                    transform: translateY(6px);
                    -webkit-animation-name: hover-shadow;
                    animation-name: hover-shadow;
                    -webkit-animation-duration: 1.5s;
                    animation-duration: 1.5s;
                    -webkit-animation-delay: .3s;
                    animation-delay: .3s;
                    -webkit-animation-timing-function: linear;
                    animation-timing-function: linear;
                    -webkit-animation-iteration-count: infinite;
                    animation-iteration-count: infinite;
                    -webkit-animation-direction: alternate;
                    animation-direction: alternate;
                }

        .shadow-radial {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .shadow-radial:after, .shadow-radial:before {
                pointer-events: none;
                position: absolute;
                content: '';
                left: 0;
                width: 100%;
                box-sizing: border-box;
                height: 5px;
                opacity: 0;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: opacity;
                transition-property: opacity;
            }

            .shadow-radial:before {
                bottom: 100%;
                background: -webkit-radial-gradient(50% 150%,ellipse,rgba(0,0,0,.6) 0,rgba(0,0,0,0) 80%);
                background: radial-gradient(ellipse at 50% 150%,rgba(0,0,0,.6) 0,rgba(0,0,0,0) 80%);
            }

            .shadow-radial:after {
                top: 100%;
                background: -webkit-radial-gradient(50% -50%,ellipse,rgba(0,0,0,.6) 0,rgba(0,0,0,0) 80%);
                background: radial-gradient(ellipse at 50% -50%,rgba(0,0,0,.6) 0,rgba(0,0,0,0) 80%);
            }

            .shadow-radial:active:after, .shadow-radial:active:before, .shadow-radial:focus:after, .shadow-radial:focus:before, .shadow-radial:hover:after, .shadow-radial:hover:before {
                opacity: 1;
            }

        .bubble-top {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .bubble-top:before {
                pointer-events: none;
                position: absolute;
                z-index: -1;
                content: '';
                border-style: solid;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: top;
                transition-property: top;
                left: calc(50% - 10px);
                top: 0;
                border-width: 0 10px 10px;
                border-color: transparent transparent #e1e1e1;
            }

            .bubble-top:active:before, .bubble-top:focus:before, .bubble-top:hover:before {
                top: -10px;
            }

        .bubble-right {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .bubble-right:before {
                pointer-events: none;
                position: absolute;
                z-index: -1;
                content: '';
                border-style: solid;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: right;
                transition-property: right;
                top: calc(50% - 10px);
                right: 0;
                border-width: 10px 0 10px 10px;
                border-color: transparent transparent transparent #e1e1e1;
            }

            .bubble-right:active:before, .bubble-right:focus:before, .bubble-right:hover:before {
                right: -10px;
            }

        .bubble-bottom {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .bubble-bottom:before {
                pointer-events: none;
                position: absolute;
                z-index: -1;
                content: '';
                border-style: solid;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: bottom;
                transition-property: bottom;
                left: calc(50% - 10px);
                bottom: 0;
                border-width: 10px 10px 0;
                border-color: #e1e1e1 transparent transparent;
            }

            .bubble-bottom:active:before, .bubble-bottom:focus:before, .bubble-bottom:hover:before {
                bottom: -10px;
            }

        .bubble-left {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .bubble-left:before {
                pointer-events: none;
                position: absolute;
                z-index: -1;
                content: '';
                border-style: solid;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: left;
                transition-property: left;
                top: calc(50% - 10px);
                left: 0;
                border-width: 10px 10px 10px 0;
                border-color: transparent #e1e1e1 transparent transparent;
            }

            .bubble-left:active:before, .bubble-left:focus:before, .bubble-left:hover:before {
                left: -10px;
            }

        .bubble-float-top {
            display: inline-block;
            position: relative;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .bubble-float-top:before {
                position: absolute;
                z-index: -1;
                content: '';
                left: calc(50% - 10px);
                top: 0;
                border-style: solid;
                border-width: 0 10px 10px;
                border-color: transparent transparent #e1e1e1;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: top;
                transition-property: top;
            }

            .bubble-float-top:active, .bubble-float-top:focus, .bubble-float-top:hover {
                -webkit-transform: translateY(5px) translateZ(0);
                transform: translateY(5px) translateZ(0);
            }

                .bubble-float-top:active:before, .bubble-float-top:focus:before, .bubble-float-top:hover:before {
                    top: -10px;
                }

        .bubble-float-right {
            display: inline-block;
            position: relative;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .bubble-float-right:before {
                position: absolute;
                z-index: -1;
                top: calc(50% - 10px);
                right: 0;
                content: '';
                border-style: solid;
                border-width: 10px 0 10px 10px;
                border-color: transparent transparent transparent #e1e1e1;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: right;
                transition-property: right;
            }

            .bubble-float-right:active, .bubble-float-right:focus, .bubble-float-right:hover {
                -webkit-transform: translateX(-5px);
                transform: translateX(-5px);
            }

                .bubble-float-right:active:before, .bubble-float-right:focus:before, .bubble-float-right:hover:before {
                    right: -10px;
                }

        .bubble-float-bottom {
            display: inline-block;
            position: relative;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .bubble-float-bottom:before {
                position: absolute;
                z-index: -1;
                content: '';
                left: calc(50% - 10px);
                bottom: 0;
                border-style: solid;
                border-width: 10px 10px 0;
                border-color: #e1e1e1 transparent transparent;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: bottom;
                transition-property: bottom;
            }

            .bubble-float-bottom:active, .bubble-float-bottom:focus, .bubble-float-bottom:hover {
                -webkit-transform: translateY(-5px) translateZ(0);
                transform: translateY(-5px) translateZ(0);
            }

                .bubble-float-bottom:active:before, .bubble-float-bottom:focus:before, .bubble-float-bottom:hover:before {
                    bottom: -10px;
                }

        .bubble-float-left {
            display: inline-block;
            position: relative;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
            -webkit-transition-property: transform;
            transition-property: transform;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .bubble-float-left:before {
                position: absolute;
                z-index: -1;
                content: '';
                top: calc(50% - 10px);
                left: 0;
                border-style: solid;
                border-width: 10px 10px 10px 0;
                border-color: transparent #e1e1e1 transparent transparent;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: left;
                transition-property: left;
            }

            .bubble-float-left:active, .bubble-float-left:focus, .bubble-float-left:hover {
                -webkit-transform: translateX(5px);
                transform: translateX(5px);
            }

                .bubble-float-left:active:before, .bubble-float-left:focus:before, .bubble-float-left:hover:before {
                    left: -10px;
                }

        .curl-top-left {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .curl-top-left:before {
                pointer-events: none;
                position: absolute;
                content: '';
                height: 0;
                width: 0;
                top: 0;
                left: 0;
                background: #fff;
                background: linear-gradient(135deg,#fff 45%,#aaa 50%,#ccc 56%,#fff 80%);
                filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0, startColorstr='#ffffff', endColorstr='#000000');
                z-index: 1000;
                box-shadow: 1px 1px 1px rgba(0,0,0,.4);
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: width,height;
                transition-property: width,height;
            }

            .curl-top-left:active:before, .curl-top-left:focus:before, .curl-top-left:hover:before {
                width: 25px;
                height: 25px;
            }

        .curl-top-right {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .curl-top-right:before {
                pointer-events: none;
                position: absolute;
                content: '';
                height: 0;
                width: 0;
                top: 0;
                right: 0;
                background: #fff;
                background: linear-gradient(225deg,#fff 45%,#aaa 50%,#ccc 56%,#fff 80%);
                box-shadow: -1px 1px 1px rgba(0,0,0,.4);
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: width,height;
                transition-property: width,height;
            }

            .curl-top-right:active:before, .curl-top-right:focus:before, .curl-top-right:hover:before {
                width: 25px;
                height: 25px;
            }

        .curl-bottom-right {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .curl-bottom-right:before {
                pointer-events: none;
                position: absolute;
                content: '';
                height: 0;
                width: 0;
                bottom: 0;
                right: 0;
                background: #fff;
                background: linear-gradient(315deg,#fff 45%,#aaa 50%,#ccc 56%,#fff 80%);
                box-shadow: -1px -1px 1px rgba(0,0,0,.4);
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: width,height;
                transition-property: width,height;
            }

            .curl-bottom-right:active:before, .curl-bottom-right:focus:before, .curl-bottom-right:hover:before {
                width: 25px;
                height: 25px;
            }

        .curl-bottom-left {
            display: inline-block;
            position: relative;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0,0,0,0);
        }

            .curl-bottom-left:before {
                pointer-events: none;
                position: absolute;
                content: '';
                height: 0;
                width: 0;
                bottom: 0;
                left: 0;
                background: #fff;
                background: linear-gradient(45deg,#fff 45%,#aaa 50%,#ccc 56%,#fff 80%);
                box-shadow: 1px -1px 1px rgba(0,0,0,.4);
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-property: width,height;
                transition-property: width,height;
            }

            .curl-bottom-left:active:before, .curl-bottom-left:focus:before, .curl-bottom-left:hover:before {
                width: 25px;
                height: 25px;
            }
    </style>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                <div class="price_table_container">
                    <div class="price_table_heading">Basic</div>
                    <div class="price_table_body">
                        <div class="price_table_row cost primary-bg"><strong>₹ 3000</strong><span>/3 MONTHS</span></div>
                        <div class="price_table_row">300 Views</div>
                        <div class="price_table_row">Upto 15 Mb</div>
                        <div class="price_table_row">Video Shoot (₹ 499)</div>
                        <div class="price_table_row">Full Time Support</div>
                    </div>
                    <a href="#" class="btn btn-primary btn-lg btn-block">Sign Up</a>
                </div>
            </div>

            <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                <div class="recommended"><strong><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>RECOMMENDED</strong></div>
                <div class="price_table_container">
                    <div class="price_table_heading">Premium</div>
                    <div class="price_table_body">
                        <div class="price_table_row cost success-bg"><strong>₹ 5000</strong><span>/6 MONTHS</span></div>
                        <div class="price_table_row">600 Views</div>
                        <div class="price_table_row">Upto 25 Mb</div>
                        <div class="price_table_row">Video Shoot (₹ 499)</div>
                        <div class="price_table_row">Full Time Support</div>
                    </div>
                    <a href="#" class="btn btn-success btn-lg btn-block">Sign Up</a>
                </div>
            </div>

            <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                <div class="price_table_container">
                    <div class="price_table_heading">Master</div>
                    <div class="price_table_body">
                        <div class="price_table_row cost info-bg"><strong>₹ 10000</strong><span>/12 MONTHS</span></div>
                        <div class="price_table_row">1200 Views</div>
                        <div class="price_table_row">Upto 20 Mb</div>
                        <div class="price_table_row">Video Shoot (₹ 499)</div>
                        <div class="price_table_row">Full Time Support</div>
                    </div>
                    <a href="#" class="btn btn-info btn-lg btn-block">Sign Up</a>
                </div>
            </div>
        </div>
    </div>
    <!-- PRICING TABLE STYLE 1-->

    <!-- SPACER-->
    <div class="spacer"></div>
</asp:Content>
