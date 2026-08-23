package buttons
{
   import events.§_-4Y§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class §_-G2L§ extends Sprite
   {
      
      protected var items:Dictionary = new Dictionary();
      
      public var §_-82q§:* = null;
      
      public var selected:§_-F1F§ = null;
      
      public var count:int = 0;
      
      public var §_-Y2N§:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public function §_-G2L§()
      {
         super();
      }
      
      public function insert(param1:§_-F1F§, param2:* = null) : void
      {
         var _loc3_:int = 0;
         if(param2 != null)
         {
            if(!(param2 is Array))
            {
               param2 = [param2];
            }
            _loc3_ = 0;
            while(_loc3_ < param2.length)
            {
               param2[_loc3_].visible = false;
               _loc3_++;
            }
         }
         this.items[param1] = param2;
         param1.addEventListener(§_-4Y§.SELECT,this.select);
         this.add(param1);
         if(this.selected == null)
         {
            ++this.count;
            this.§_-32c§(param1);
            dispatchEvent(new §_-4Y§(§_-4Y§.CHANGE));
            return;
         }
         ++this.count;
         dispatchEvent(new §_-4Y§(§_-4Y§.CHANGE));
      }
      
      public function §_-vC§(param1:int) : void
      {
         var _loc2_:DisplayObject = this.§_-Y2N§[param1];
         this.§_-32c§(_loc2_ ? _loc2_ : this.§_-Y2N§[0]);
      }
      
      public function §_-32c§(param1:*) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(this.selected == param1)
         {
            return;
         }
         if(this.selected != null)
         {
            this.selected.sticked = false;
         }
         for(_loc2_ in this.items)
         {
            _loc3_ = this.items[_loc2_];
            if(_loc3_ != null)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc3_[_loc4_].visible = _loc2_ == param1;
                  if(_loc3_[_loc4_].visible)
                  {
                     this.§_-82q§ = _loc3_[_loc4_];
                  }
                  _loc4_++;
               }
            }
         }
         if(param1 != null)
         {
            param1.sticked = true;
         }
         this.selected = param1;
         dispatchEvent(new §_-4Y§(§_-4Y§.SELECT,param1));
      }
      
      private function add(param1:*) : void
      {
         addChild(param1);
         this.§_-Y2N§.push(param1);
      }
      
      private function select(param1:§_-4Y§) : void
      {
         this.§_-32c§(param1.button);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(this.§_-82q§)
         {
            this.§_-82q§.visible = param1;
         }
      }
   }
}

