package buttons
{
   import events.§_-b2G§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class §_-Hg§ extends Sprite
   {
      
      protected var items:Dictionary = new Dictionary();
      
      public var §_-KH§:* = null;
      
      public var selected:§_-uH§ = null;
      
      public var count:int = 0;
      
      public var §_-a3§:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public function §_-Hg§()
      {
         super();
      }
      
      public function insert(param1:§_-uH§, param2:* = null) : void
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
         param1.addEventListener(§_-b2G§.SELECT,this.select);
         this.add(param1);
         if(this.selected == null)
         {
            ++this.count;
            this.§_-l1Y§(param1);
            dispatchEvent(new §_-b2G§(§_-b2G§.CHANGE));
            return;
         }
         ++this.count;
         dispatchEvent(new §_-b2G§(§_-b2G§.CHANGE));
      }
      
      public function §_-n10§(param1:int) : void
      {
         var _loc2_:DisplayObject = this.§_-a3§[param1];
         this.§_-l1Y§(_loc2_ ? _loc2_ : this.§_-a3§[0]);
      }
      
      public function §_-l1Y§(param1:*) : void
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
                     this.§_-KH§ = _loc3_[_loc4_];
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
         dispatchEvent(new §_-b2G§(§_-b2G§.SELECT,param1));
      }
      
      private function add(param1:*) : void
      {
         addChild(param1);
         this.§_-a3§.push(param1);
      }
      
      private function select(param1:§_-b2G§) : void
      {
         this.§_-l1Y§(param1.button);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(this.§_-KH§)
         {
            this.§_-KH§.visible = param1;
         }
      }
   }
}

