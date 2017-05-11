package exercise;

import java.io.*;

public class FileInputOutput
{
	public void saveFile(String inFile, String outFile)
	{
		File in = new File(inFile);
		File out = new File(outFile);

		try(InputStream is = new FileInputStream(in);
			BufferedInputStream bis = new BufferedInputStream(is);
			OutputStream os = new FileOutputStream(out))
		{
			byte [] buffer = new byte [8 * 1024];
			int length;
			while ( (length = bis.read(buffer)) != -1 )
			{
				if ( length > 0 )
					os.write(buffer , 0 , length);
			}
			os.flush();

		}
		catch ( FileNotFoundException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch ( IOException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 파일로부터 텍스트 읽기.
	public void readFileData(String file)
	{
		File infile = new File(file);
		try
		{
			InputStream is = new FileInputStream(infile);
			BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
			String line;
			while((line=br.readLine())!=null)
			{
				System.out.println(line);
			}
			
		}
		catch ( FileNotFoundException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch ( UnsupportedEncodingException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch ( IOException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void saveFileMyObject(String file, MyObject object)
	{
		File outFile = new File(file);
		try
		{
			OutputStream os = new FileOutputStream(outFile);
			ObjectOutputStream oos = new ObjectOutputStream(os);
			oos.writeObject(object);
		}
		catch ( FileNotFoundException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch ( IOException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public MyObject readFileMyObject(String file)
	{
		File inFile = new File(file);
		try
		{
			InputStream is = new FileInputStream(inFile);
			ObjectInputStream ois = new ObjectInputStream(is);
			return (MyObject)ois.readObject();
		}
		catch ( FileNotFoundException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch ( IOException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch ( ClassNotFoundException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
