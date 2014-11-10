
public class StringChars {

	static int[] charCounts = new int[128];
	static int maxInd = 0;
	static int maxNonSpaceInd = 0;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 0; i < args.length; i++)
			System.out.println(
			"\'" + findMostCommonChar(args[i]) + "\'" +
			" is the most common non-space character in \"" + args[i] + "\".");

	}
	
	public static char findMostCommonChar(String sentence)
	{
		resetCharCounts();
		for (int i = 0; i < sentence.length(); i++)
		{
			int charInd = (int)sentence.charAt(i); 
			charCounts[charInd]++;
			if (charCounts[charInd] > charCounts[maxInd])
				maxInd = charInd;
			if (charInd != 32 && charCounts[charInd] > charCounts[maxNonSpaceInd])
				maxNonSpaceInd = charInd;
		}
		return Character.toChars(maxNonSpaceInd)[0];
	}

	static void resetCharCounts()
	{
		maxInd = 0;
		maxNonSpaceInd = 0;
		for (int i = 0; i < 128; i++) charCounts[i] = 0;
	}
}
