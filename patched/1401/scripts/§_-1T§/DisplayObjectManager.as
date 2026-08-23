package §_-1T§
{
   import starling.display.§_-jH§;
   
   public class DisplayObjectManager
   {
      
      private static var _instance:DisplayObjectManager;
      
      private var collection:Vector.<§_-jH§> = new Vector.<§_-jH§>();
      
      private var collectionName:Vector.<String> = new Vector.<String>();
      
      private var §_-h18§:int = 0;
      
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
      
      public function remove(param1:§_-jH§) : void
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
      
      private function §_-d0§() : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Vector.<§_-jH§> = new Vector.<§_-jH§>();
         var _loc3_:int = int(this.collection.length);
         while(_loc2_ < _loc3_)
         {
            if(§_-TQ§.§_-u24§)
            {
               if(this.§_-h18§ - 1 == _loc2_)
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
         this.§_-d0§();
         return this.collection.length;
      }
      
      public function set §_-Q1y§(param1:int) : void
      {
         this.§_-h18§ = param1;
      }
      
      public function get §_-Q1y§() : int
      {
         return this.§_-h18§;
      }
      
      public function §_-z2X§() : void
      {
         var _loc1_:* = int(this.collection.length - 1);
         var _loc2_:int = this.§_-h18§;
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
         this.collectionName.splice(this.§_-h18§,this.collectionName.length - this.§_-h18§);
         this.collection.splice(this.§_-h18§,this.collection.length - this.§_-h18§);
      }
      
      public function add(param1:§_-jH§, param2:String) : void
      {
         if(param1 is §_-jH§)
         {
            this.collection.push(param1);
            this.collectionName.push(param2);
         }
         else
         {
            §_-TQ§.add("error! DisplayObjectManager items is not DisplayObject!",param1);
         }
      }
   }
}

