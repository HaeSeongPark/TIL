package ch15_IO;

import java.io.*;
import java.util.Arrays;

public class DataOutputStreameEx2 {
	public static void main(String[] args) {
		try(ByteArrayOutputStream bos = new ByteArrayOutputStream();
			DataOutputStream dos = new DataOutputStream(bos)) {
			
			dos.writeInt(10);
			dos.writeFloat(20.0f);
			dos.writeBoolean(true);
			
			byte[] result = bos.toByteArray();
			String[] hex = new String[result.length];
			
			for(int i=0; i<result.length; i++){
				if(result[i]<0)
					hex[i] = String.format("%02x", result[i]+256);
				else
					hex[i] = String.format("%02x", result[i]);
			}
			
			System.out.println("10진수 : " + Arrays.toString(result));
			System.out.println("16진수 : " + Arrays.toString(hex));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
