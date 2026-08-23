package §_-Mq§
{
   import starling.display.§_-I2q§;
   
   public class DisplayObjectManager
   {
      
      private static var _instance:DisplayObjectManager;
      
      private var collection:Vector.<§_-I2q§> = new Vector.<§_-I2q§>();
      
      private var collectionName:Vector.<String> = new Vector.<String>();
      
      private var §_-41U§:int = 0;
      
      public function DisplayObjectManager()
      {
         super();
      }
      
      public static function getInstance() : DisplayObjectManager
      {
         if(!_instance)
         {
            _instance = new DisplayObjectManager();
         }
         return _instance;
      }
      
      public function remove(param1:§_-I2q§) : void
      {
         var _loc2_:int = this.collection.indexOf(param1);
         if(_loc2_ > -1)
         {
            while(true)
            {
               _loc2_ = this.collection.indexOf(param1);
               if(_loc2_ == -1)
               {
                  break;
               }
               this.collection[_loc2_].removeFromParent(true);
               this.collection[_loc2_].dispose();
               this.collection[_loc2_] = null;
               this.collectionName[_loc2_] = null;
               this.collection.splice(_loc2_,1);
               this.collectionName.splice(_loc2_,1);
            }
            return;
         }
      }
      
      private function §_-G2k§() : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Vector.<§_-I2q§> = new Vector.<§_-I2q§>();
         var _loc3_:int = int(this.collection.length);
         while(_loc2_ < _loc3_)
         {
            if(§_-p2U§.§_-i10§)
            {
               if(this.§_-41U§ - 1 == _loc2_)
               {
               }
            }
            if(this.collection[_loc2_].width == 1 && this.collection[_loc2_].height == 1)
            {
               this.collection[_loc2_] = null;
               this.collectionName[_loc2_] = null;
               _loc1_.push(this.collection[_loc2_]);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(_loc1_.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.collection.indexOf(_loc1_[_loc2_]);
            if(_loc4_ > -1)
            {
               this.collection.splice(_loc4_,1);
               this.collectionName.splice(_loc4_,1);
            }
            _loc2_++;
         }
         _loc1_ = null;
      }
      
      public function get length() : int
      {
         this.§_-G2k§();
         return this.collection.length;
      }
      
      public function set §_-i16§(param1:int) : void
      {
         this.§_-41U§ = param1;
      }
      
      public function get §_-i16§() : int
      {
         return this.§_-41U§;
      }
      
      public function §_-q1y§() : void
      {
         var _loc1_:* = int(this.collection.length - 1);
         var _loc2_:int = this.§_-41U§;
         while(_loc1_ > _loc2_)
         {
            try
            {
               this.collection[_loc1_].removeFromParent(true);
               this.collection[_loc1_].dispose();
            }
            catch(e:Error)
            {
            }
            this.collection[_loc1_] = null;
            this.collectionName[_loc1_] = null;
            _loc1_--;
         }
         this.collectionName.splice(this.§_-41U§,this.collectionName.length - this.§_-41U§);
         this.collection.splice(this.§_-41U§,this.collection.length - this.§_-41U§);
      }
      
      public function add(param1:§_-I2q§, param2:String) : void
      {
         if(param1 is §_-I2q§)
         {
            this.collection.push(param1);
            this.collectionName.push(param2);
         }
         else
         {
            §_-p2U§.add("error! DisplayObjectManager items is not DisplayObject!",param1);
         }
      }
   }
}

