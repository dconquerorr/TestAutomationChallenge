package DevOps;

import static org.junit.Assert.assertTrue;

import java.sql.Driver;
import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;


public class AppTest 
{
	public static WebDriver driver;
	
	@BeforeClass
	public static void setup() throws InterruptedException
	{
		System.setProperty("webdriver.chrome.driver", "/usr/bin/chromedriver"); 
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--headless");
		driver = new ChromeDriver(options);		
		driver.get("http://localhost:9010/java-tomcat-maven-example/index.jsp");
		driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
		Thread.sleep(3000);		
	}

    @Test
    public void VerifyHeading1()
    {
    	String Heading1 = driver.findElement(By.xpath("//h1")).getText();
    	System.out.println(Heading1);
    	if (Heading1.equals("Hello World!"))
    	{
    		assertTrue("First Heading Matched",true);
    	}
    	else
    	{
    		assertTrue("First Heading not Matched",false);
    	}
        
    }
    
    @Test
    public void VerifyHeading2()
    {
    	String Heading1 = driver.findElement(By.xpath("//h2")).getText();
    	System.out.println(Heading1);
    	if (Heading1.equals("Welcome to Devops region"))
    	{    		
    		assertTrue("Second Heading Matched",true);    		
    	}
    	else
    	{
    		assertTrue("Second Heading not Matched",false);
    	}
        
    }
    
    @Test
    public void VerifyHeading3()
    {
    	String Heading1 = driver.findElement(By.xpath("//h3")).getText();
    	System.out.println(Heading1);
    	if (Heading1.equals("WelCome to Jenkins! pipeline"))
    	{
    		assertTrue("Third Heading Matched",true);
    	}
    	else
    	{
    		assertTrue("Third Heading not Matched",false);
    	}
        
    }
    
    
    @Test
    public void VerifyHeading4()
    {
    	String Heading1 = driver.findElement(By.xpath("//h4")).getText();
    	System.out.println(Heading1);
    	if (Heading1.equals("This is new change from github"))
    	{
    		assertTrue("Fourth Heading Matched",true);
    	}
    	else
    	{
    		assertTrue("Fourth Heading not Matched",false);
    	}
        
    }
    
    
    
    @AfterClass
    public static void cleanup()
    {
    	driver.quit();
    }
}
