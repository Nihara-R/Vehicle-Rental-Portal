package Reviews;

public class Reviews {
	private int id;
	private String username;
	private String email;
	private String reviewText;
	private int starRating;
	private String timestamp;
	
	public Reviews() {
		super();
	}
	
	public Reviews(String username, String email, String reviewText, int starRating, String timestamp) {
		super();
		this.username = username;
		this.email = email;
		this.reviewText = reviewText;
		this.starRating = starRating;
		this.timestamp = timestamp;
	}

	public Reviews(int id, String username, String email, String reviewText, int starRating, String timestamp) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.reviewText = reviewText;
		this.starRating = starRating;
		this.timestamp = timestamp;
	}
	
    public Reviews(int id, String fullName, String email, String reviewText) {
    	super();
    	this.id = id;
        this.username = fullName;
        this.email = email;
        this.reviewText = reviewText;
    }
    
    public Reviews(int id, String fullName, String reviewText) {
    	super();
    	this.id = id;
        this.username = fullName;
        this.reviewText = reviewText;
    }

	public int getId() {
		return id;
	}

	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}

	public String getReviewText() {
		return reviewText;
	}

	public int getStarRating() {
		return starRating;
	}

    public String getTimestamp() {
        return timestamp;
    }

	public void setId(int id) {
		this.id = id;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public void setStarRating(int starRating) {
		this.starRating = starRating;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
}
