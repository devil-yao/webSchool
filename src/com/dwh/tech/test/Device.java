package com.dwh.tech.test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioFileFormat.Type;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;
import javax.sound.sampled.TargetDataLine;

import org.junit.Test;

public class Device {

	static AudioFormat au;
	static TargetDataLine td = null; 
	
	public static void main(String [] args) throws LineUnavailableException{
		 //采样率是每秒播放和录制的样本数  
//      float sampleRate = 16000.0F;  
//      // 采样率8000,11025,16000,22050,44100  
//      //sampleSizeInBits表示每个具有此格式的声音样本中的位数  
//      int sampleSizeInBits = 16;  
//      // 8,16  
//      int channels = 1;  
//      // 单声道为1，立体声为2  
//      boolean signed = true;  
//      // true,false  
//      boolean bigEndian = true;  
//      // true,false  
//       au = new AudioFormat(sampleRate, sampleSizeInBits, channels, signed,bigEndian); 
		AudioFormat.Encoding encoding = AudioFormat.Encoding.  
		        PCM_SIGNED ;  
		        float rate = 8000f;  
		        int sampleSize = 16;  
		        String signedString = "signed";  
		        boolean bigEndian = true;  
		        int channels = 1;  
		        au = new AudioFormat(encoding, rate, sampleSize, channels,  
		                (sampleSize / 8) * channels, rate, bigEndian);  
//		AudioFormat au = new AudioFormat();
		DataLine.Info info = new DataLine.Info(TargetDataLine.class,au);
//		Thread thread = new Thread(target) 
		td = (TargetDataLine)(AudioSystem.getLine(info));  
        
        //打开具有指定格式的行，这样可使行获得所有所需的系统资源并变得可操作。  
        td.open(au);  
        //允许某一数据行执行数据 I/O  
        td.start();  
          
        Record record = new Record();  
        Thread t1 = new Thread(record);  
        t1.start();  
	}
	
	static class Record implements Runnable{
		byte bts[] = new byte[10000];  
        //将字节数组包装到流里，最终存入到baos中  
        //重写run函数  
        public void run() {   
        	ByteArrayOutputStream baos = new ByteArrayOutputStream();       
            try {  
               boolean stopflag = false;  
                while(stopflag != true)  
                {  
                    //当停止录音没按下时，该线程一直执行   
                    //从数据行的输入缓冲区读取音频数据。  
                    //要读取bts.length长度的字节,cnt 是实际读取的字节数  
                    int cnt = td.read(bts, 0, bts.length);  
                    if(cnt > 0)  
                    {  
                        baos.write(bts, 0, cnt);  
                    }  
                      
                    //开始从音频流中读取字节数  
                    byte copyBts[] = bts;  
                    ByteArrayInputStream bais = new ByteArrayInputStream(copyBts);  
                    AudioInputStream ais = new AudioInputStream(bais, au, copyBts.length/au.getFrameSize());  
                    try{  
                        DataLine.Info dataLineInfo = new DataLine.Info(SourceDataLine.class, au);  
                        SourceDataLine sd = (SourceDataLine) AudioSystem.getLine(dataLineInfo);  
                        sd.open(au);  
                        sd.start();  
                          
                        //从音频流中读取  
                        int Buffer_Size = 10000;  
                        byte [] audioDataBuffer = new byte[Buffer_Size];  
                        int outBytes;  
                     
                        int intBytes = ais.read(audioDataBuffer, 0,audioDataBuffer.length);  
                          
//                      不写到混频器中这样就不会播放  
//                      if (intBytes >= 0) {  
//                          outBytes = sd.write(audioDataBuffer, 0,audioDataBuffer.length);  
//                      }     
                    }catch (Exception e) {  
                        e.printStackTrace();  
                    }  
                }  
            } catch (Exception e) {  
                e.printStackTrace();  
            }finally{  
                try {  
                    //intBytes = -1;  
                    //关闭打开的字节数组流  
                    if(baos != null)  
                    {  
                        baos.close();  
                    }     
                } catch (Exception e) {  
                    e.printStackTrace();  
                }finally{  
                    //下面这句td.drain()不能要，这样如果不播放数据就阻塞再次录音会出现其他程序访问错误  
                    //td.drain();  
                    td.close();  
                    //刷新显示波形的面板  
                }  
            }  
        }  
	}	
}
