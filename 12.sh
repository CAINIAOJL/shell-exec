#!/bin/bash
echo "##############################################"
echo 
echo "     This sript checks your linux system for popular"
echo "package managers and application containers, lists"
echo "what's available and makes an educated guess on your"
echo "distribution's base distro (Red hat or Debian)"
echo "##############################################"

echo
echo "Checking for Red Hat-based package managers &"
echo "application containers..."


#if [ which rpm &> /dev/null ]; then
if [ -n "$(command -v rpm)" ]; then
    item_rpm=1
    echo "you have the basic rpm utility"
else
    item_rpm=0
fi
echo "rpm is " $item_rpm

#if [ which flatpak &> /dev/null ]; then
if [ -n "$(command -v flatpak)" ]; then
    item_flatpak=1
    echo "you have the flatpak utility"
else
    item_flatpak=0
fi
echo "flatpak is " $item_flatpak 

#if [ which dnf &> /dev/null ]; then
if [ -n "$(command -v dnf)" ]; then
    item_dnf=1
    echo "you have the dnf utility"
else
    item_dnf=0
fi
echo "dnf if " $item_dnf

#if [ which yum &> /dev/null ]; then
if [ -n "$(command -v yum)" ]; then
    item_yum=1
    echo "you have the yum utility"
else
    item_yum=0
fi
echo "yum is " $item_yum

redhatscore=$(($item_rpm + $item_flatpak + $item_dnf + $item_yum))

echo
echo "Checking for Debian-based package managers &"
echo "application containers..."

#if [ which dpkg &> /dev/null ]; then
if [ -n "$(command -v dpkg)" ]; then
    item_dpkg=1
    echo "you have the basic dpkg utility"
else
    item_dpkg=0
fi
echo "dpkg is " $item_dpkg

#if [ which snap &> /dev/null ]; then
if [ -n "$(command -v snap)" ]; then
    item_snap=1
    echo "you have the snap utility"
else
    item_snap=0
fi
echo "snap is" $item_snap

#if [ which apt &> /dev/null ]; then
if [ -n "$(command -v apt)" ]; then
    item_apt_get=1
    echo "you have the apt utility"
else
    item_apt_get=0
fi

#if [ which apt-get &> /dev/null ]; then
if [ -n "$(command -v apt-get)" ]; then
    item_apt_get=1
    echo "you have the apt-get utility"
else
    item_apt_get=0
fi
echo "apt-get is" $item_apt_get

debianscore=$(($item_dpkg + $item_snap + $item_apt_get)) 

echo "debianscore is $debianscore"
echo "redhatscore is $redhatscore"

if [ $debianscore -gt $redhatscore ]; then
    echo "Most likely your Linux distribution is Debian-based"
elif [ $debianscore -lt $redhatscore ]; then
    echo "Most likely your Linux distribution is Red-based"
else 
    echo "Unable to determine Linux distribution base"
fi