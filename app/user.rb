class User
  attr_reader :favorites
  FavoriteChoices = %w{Ruby Python Clojure Lisp Erlang Haskell}

  def self.current
    @user ||= begin
      if storage.exists?
        unarchive
      else
        new
      end
    end
  end

  def self.persist
    NSKeyedArchiver.archiveRootObject(self.current, toFile:storage)
  end

  def initialize
    @favorites = []
  end

  def likes?(lang)
    @favorites.include? lang
  end

  def likes!(lang)
    @favorites << lang
  end

  def dislikes!(lang)
    @favorites.delete(lang)
  end

  def encodeWithCoder(coder)
    coder.encodeObject(@favorites, forKey:'favorites')
  end

  def initWithCoder(coder)
    @favorites = coder.decodeObjectForKey('favorites')
    self
  end

private
  def self.storage
    'user.xml'.document
  end

  def self.unarchive
    NSKeyedUnarchiver.unarchiveObjectWithFile(storage)
  end

end