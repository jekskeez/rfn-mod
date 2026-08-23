package utils
{
   import §_-TK§.§_-aS§;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   
   public class §_-z22§ extends §_-aS§
   {
      
      private var §_-oS§:String = "";
      
      private var §_-t2t§:Boolean = true;
      
      public function §_-z22§(param1:Boolean = true)
      {
         super();
         this.§_-t2t§ = param1;
      }
      
      override public function getRect(param1:DisplayObject) : Rectangle
      {
         var _loc2_:Rectangle = super.getRect(param1);
         return new Rectangle(_loc2_.x + 25,_loc2_.y,_loc2_.width - 50,_loc2_.height);
      }
      
      public function get totalFrames() : int
      {
         var _loc1_:Object = null;
         if(this.numChildren > 0)
         {
            if(this.§_-t2t§)
            {
               _loc1_ = §_-kD§(0);
            }
            else
            {
               _loc1_ = getChildAt(0);
            }
            return _loc1_.totalFrames;
         }
         return 0;
      }
      
      override public function play() : void
      {
         var _loc2_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.numChildren)
         {
            if(this.§_-t2t§)
            {
               _loc2_ = §_-kD§(_loc1_);
            }
            else
            {
               _loc2_ = getChildAt(_loc1_);
            }
            _loc2_.play();
            _loc1_++;
         }
      }
      
      public function stop() : void
      {
         var _loc2_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.numChildren)
         {
            if(this.§_-t2t§)
            {
               _loc2_ = §_-kD§(_loc1_);
            }
            else
            {
               _loc2_ = getChildAt(_loc1_);
            }
            if(_loc2_)
            {
               _loc2_.stop();
            }
            _loc1_++;
         }
      }
      
      public function gotoAndStop(param1:int, param2:String = null) : void
      {
         var _loc4_:Object = null;
         if(!param2)
         {
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.numChildren)
         {
            if(this.§_-t2t§)
            {
               _loc4_ = §_-kD§(_loc3_);
            }
            else
            {
               _loc4_ = getChildAt(_loc3_);
            }
            _loc4_.gotoAndStop(param1);
            _loc3_++;
         }
      }
      
      public function gotoAndPlay(param1:int, param2:String = null) : void
      {
         var _loc4_:Object = null;
         if(!param2)
         {
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.numChildren)
         {
            if(this.§_-t2t§)
            {
               _loc4_ = §_-kD§(_loc3_);
            }
            else
            {
               _loc4_ = getChildAt(_loc3_);
            }
            if(_loc4_)
            {
               _loc4_.gotoAndPlay(param1);
            }
            _loc3_++;
         }
      }
      
      public function §_-v1H§(param1:String) : void
      {
         this.§_-oS§ = param1;
      }
      
      public function getName() : String
      {
         return this.§_-oS§;
      }
   }
}

