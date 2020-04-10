from django.http import response, HttpResponse
from django.shortcuts import render
def login(request,username):
    return HttpResponse(username)

def quit(request,username):
    pass

def display(request,username):
    pass

def status():
    pass

