package tape
{
   import §_-k1c§.§_-9f§;
   import §_-r2Y§.§_-33e§;
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.HScrollBar;
   
   public class §_-A3S§ extends §_-3l§
   {
      
      protected var §_-Y1y§:§_-n1X§ = null;
      
      private var image:Sprite = null;
      
      private var scroll:HScrollBar = null;
      
      private var §_-Cd§:Function = null;
      
      public function §_-A3S§(param1:Function)
      {
         super(1,4,718,37,0,0,90,100,false,false);
         removeChild(this.buttonNext);
         removeChild(this.§_-Z2B§);
         this.init();
         this.§_-Cd§ = param1;
      }
      
      override public function setData(param1:§_-xc§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(§_-33e§.STICKED,this.§_-a16§);
         }
         super.setData(param1);
         this.select(this.data.objects.length > 0 ? this.data.objects[0] as §_-n1X§ : null);
         this.scroll.visible = this.data.objects.length > this.§_-x16§;
         this.data.addEventListener(§_-33e§.STICKED,this.§_-a16§);
      }
      
      override protected function update() : void
      {
         super.update();
         this.scroll.§_-P1q§(this.data ? this.offset / (this.data.objects.length - this.§_-x16§) : 0);
      }
      
      public function §_-81e§() : Sprite
      {
         return this.image;
      }
      
      public function removeObject(param1:int = 0, param2:int = 0) : void
      {
         var _loc4_:§_-n1X§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.data.objects.length)
         {
            _loc4_ = this.data.objects[_loc3_] as §_-n1X§;
            if(!(_loc4_.id != param1 || _loc4_.type != param2))
            {
               if(this.data.objects.splice(_loc3_,1)[0] == this.§_-Y1y§)
               {
                  this.select(this.data.objects.length > 0 ? this.data.objects[0] as §_-n1X§ : null);
               }
               this.scroll.visible = this.data.objects.length > this.§_-x16§;
               break;
            }
            _loc3_++;
         }
         this.offset = Math.min(this.offset,this.data.objects.length - this.§_-x16§);
         this.update();
      }
      
      private function init() : void
      {
         this.scroll = new HScrollBar(400);
         this.scroll.x = 822;
         this.scroll.y = 37;
         this.scroll.addEventListener(HScrollBar.ON_SCROLL,this.§_-yb§);
         addChild(this.scroll);
         var _loc1_:ImageNewsFrame = new ImageNewsFrame();
         _loc1_.mouseEnabled = false;
         addChild(_loc1_);
      }
      
      private function §_-yb§(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(this.data)
         {
            _loc2_ = this.scroll.value;
            _loc3_ = int(this.scroll.value * (this.data.objects.length - this.§_-x16§));
            if(_loc3_ != this.offset)
            {
               this.offset = _loc3_;
               this.scroll.§_-P1q§(_loc2_);
            }
         }
      }
      
      private function §_-x2k§(param1:§_-n1X§) : void
      {
         if(!param1)
         {
            return;
         }
         if(this.image)
         {
            removeChild(this.image);
         }
         switch(param1.type)
         {
            case §_-n1X§.§_-K12§:
               this.image = §_-9f§.§_-X2y§(param1.id);
         }
         if(this.image == null)
         {
            return;
         }
         this.image.x = this.image.y = 10;
         this.image.scaleX = Math.max(1,700 / this.image.width);
         this.image.scaleY = Math.max(1,460 / this.image.height);
         addChildAt(this.image,0);
      }
      
      private function §_-a16§(param1:§_-33e§) : void
      {
         this.select(param1.element as §_-n1X§);
      }
      
      private function select(param1:§_-n1X§) : void
      {
         if(this.§_-Y1y§ == param1)
         {
            return;
         }
         if(this.§_-Y1y§ != null)
         {
            this.§_-Y1y§.selected = false;
         }
         this.§_-Y1y§ = param1;
         if(this.§_-Y1y§ != null)
         {
            this.§_-Y1y§.selected = true;
         }
         this.§_-x2k§(this.§_-Y1y§);
         this.§_-Cd§(this.§_-Y1y§ ? this.§_-Y1y§.id : 0);
      }
   }
}

