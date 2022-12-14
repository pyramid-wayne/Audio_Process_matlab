function varargout = untitled(varargin)
% UNTITLED M-file for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 11-May-2013 09:57:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_Open_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,fs,bits]=wavread('voice.wav');%????????????
fs  %????????????
bits  %????????????
sound(x,fs,bits); % ??????voice.wav??????
ms2=floor (fs*0.002);
ms10=floor (fs*0.01);
ms20=floor (fs*0.02);
ms30=floor (fs*0.03);
t=(0:length(x)-1)/fs;  %????????????
plot(t,x); %??????????????????
legend('Waveform');
xlabel('Time(s)');
ylabel('Amplitude');


% --------------------------------------------------------------------
function Untitled_File_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_Process_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_Process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_Modulate_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_Modulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_Range_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_Range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,fs,bits]=wavread('voice.wav');
ms2=floor(fs*0.002);
ms10=floor(fs*0.01);
ms20=floor(fs*0.02);
ms30=floor(fs*0.03);
t=(0:length(x)-1)/(fs);  %????????????
plot(t,x*4);   %???????????? 
sound(x*4,fs,bits);%????????????????????
wavwrite(4*x,fs,bits,'????');%??????????????????????????.wav??
legend('Waveform'); 
xlabel('Time(s)');
ylabel('Amplitude');


% --------------------------------------------------------------------
function Untitled_Frequency_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,fs,bits]=wavread('voice.wav');
ms2=floor(fs*0.002);
ms10=floor(fs*0.01);
ms20=floor(fs*0.02);
ms30=floor(fs*0.03);
t=(0:length(x)-1)/(2*fs);  %????????????
sound(x,2*fs,bits);%????2????????????
wavwrite(x,2*fs,bits,'????');%??????????????????????????.wav??
plot(t,x); %????????????????????
legend('Waveform');
xlabel('Time(s)');
ylabel('Amplitude');


% --------------------------------------------------------------------
function Untitled_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_LowpassFilter_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_LowpassFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,fs,bits]=wavread('voice.wav');
wp=0.075;ws=0.125;Rp=0.25;Rs=50;
[N,Wn]=cheb1ord(wp,ws,Rp,Rs);
[b,a]=cheby1(N,Rp,Wn);
[b,a]=cheby1(N,Rp,Wn);
X=fft(x);
subplot(221);plot(x);title('????????????????');
subplot(222);plot(X);title('????????????????');
y=filter(b,a,x); %IIR????????
sound(y,fs,bits);%????????????????????
wavwrite(y,fs,bits,'????');%??????????????????????????.wav??
Y=fft(y);
subplot(223);plot(y);title(' IIR????????????????');
subplot(224);plot(Y);title(' IIR????????????????');


% --------------------------------------------------------------------
function Untitled_HighpassFilter_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_HighpassFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,fs,bits]=wavread('voice.wav');
wp=0.6;ws=0.975;Rp=0.25;Rs=50;
[N,Wn]=cheb2ord(wp,ws,Rp,Rs);
[b,a]=cheby2(N,Rs,Wn);
[b,a]=cheby2(N,Rs,Wn,'high');
X=fft(x);
subplot(221);plot(x);title('????????????????');
subplot(222);plot(X);title('????????????????');
y=filter(b,a,x); 
sound(y,fs,bits);%????????????????
wavwrite(y,fs,bits,'????');%??????????????????????????.wav??
Y=fft(y);
subplot(223);plot(y);title('IIR????????????????');
subplot(224);plot(Y);title('IIR????????????????');


% --------------------------------------------------------------------
function Untitled_BandpassFilter_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_BandpassFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,fs,bits]=wavread('voice.wav');
N=5;wc=[0.3 0.6] ;
[b,a]=butter(N,wc);
X=fft(x);
subplot(221);plot(x);title('????????????????');
subplot(222);plot(X);title('????????????????');
y=filter(b,a,x);%IIR????????
Y=fft(y);
sound(y,fs,bits);% ????????????????
wavwrite(y,fs,bits,'????');% ??????????????????????????.wav??
subplot(223);plot(y);title(' IIR????????????????');
subplot(224);plot(Y);title(' IIR????????????????');


% --------------------------------------------------------------------
function BandstopFilter_Callback(hObject, eventdata, handles)
% hObject    handle to BandstopFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,fs,bits]=wavread('voice');
N=5;wc=[0.2 0.7] ;
[b,a]=butter(N,wc,'stop');
X=fft(x);
subplot(221);plot(x);title('????????????????');
subplot(222);plot(X);title('????????????????');
y=filter(b,a,x);%IIR????????
Y=fft(y);
sound(y,fs,bits);% ????????????????
wavwrite(y,fs,bits,'????');% ??????????????????????????.wav??
subplot(223);plot(y);title(' IIR????????????????');
subplot(224);plot(Y);title(' IIR????????????????');


% --------------------------------------------------------------------
function Untitled_FFT_IFFT_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_FFT_IFFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=wavread('voice');
sound(x);
t=(0:length(x)-1)/8000;
subplot(3,1,1)
plot(t,x)%????????????????????????
grid on;  
axis tight;
title('????????????');
xlabel('time(s)');
ylabel('????');
fs=8000;N=512;
y=fft(x,N);
magy=abs(y);
f=(0:length(y)-1)'*fs/length(y); 
subplot(3,1,2);plot(f,magy);
legend('??????(FFT)'); %????????
ylabel('????(db)');
xlabel('????(Hz)');
c=fft(log(abs(x)+eps));  %????????
ms1=fs/1000;
ms20=fs/50;
q=(ms1:ms20)/fs;  %????????????
subplot(3,1,3);
plot(q,abs(c(ms1:ms20))); %????????
legend('??????(IFFT)');
xlabel('????(s)');
ylabel('??????????(Hz)');


