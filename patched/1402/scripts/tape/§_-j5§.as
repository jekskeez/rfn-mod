package tape
{
   import §_-a11§.§_-h2m§;
   import §_-bN§.§_-RY§;
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.HScrollBar;
   
   public class §_-j5§ extends §_-L2v§
   {
      
      protected var §_-02G§:§_-gn§ = null;
      
      private var image:Sprite = null;
      
      private var scroll:HScrollBar = null;
      
      private var §_-Ei§:Function = null;
      
      public function §_-j5§(param1:Function)
      {
         super(1,4,718,37,0,0,90,100,false,false);
         removeChild(this.buttonNext);
         removeChild(this.§_-T1X§);
         this.init();
         this.§_-Ei§ = param1;
      }
      
      override public function setData(param1:§_-h2f§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(§_-h2m§.STICKED,this.§_-X1z§);
         }
         super.setData(param1);
         this.select(this.data.objects.length > 0 ? this.data.objects[0] as §_-gn§ : null);
         this.scroll.visible = this.data.objects.length > this.§_-w1q§;
         this.data.addEventListener(§_-h2m§.STICKED,this.§_-X1z§);
      }
      
      override protected function update() : void
      {
         super.update();
         this.scroll.§_-r1E§(this.data ? this.offset / (this.data.objects.length - this.§_-w1q§) : 0);
      }
      
      public function §_-e14§() : Sprite
      {
         return this.image;
      }
      
      public function removeObject(param1:int = 0, param2:int = 0) : void
      {
         var _loc4_:§_-gn§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.data.objects.length)
         {
            _loc4_ = this.data.objects[_loc3_] as §_-gn§;
            if(!(_loc4_.id != param1 || _loc4_.type != param2))
            {
               if(this.data.objects.splice(_loc3_,1)[0] == this.§_-02G§)
               {
                  this.select(this.data.objects.length > 0 ? this.data.objects[0] as §_-gn§ : null);
               }
               this.scroll.visible = this.data.objects.length > this.§_-w1q§;
               break;
            }
            _loc3_++;
         }
         this.offset = Math.min(this.offset,this.data.objects.length - this.§_-w1q§);
         this.update();
      }
      
      private function init() : void
      {
         this.scroll = new HScrollBar(400);
         this.scroll.x = 822;
         this.scroll.y = 37;
         this.scroll.addEventListener(HScrollBar.ON_SCROLL,this.§_-X2c§);
         addChild(this.scroll);
         var _loc1_:ImageNewsFrame = new ImageNewsFrame();
         _loc1_.mouseEnabled = false;
         addChild(_loc1_);
      }
      
      private function §_-X2c§(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(this.data)
         {
            _loc2_ = this.scroll.value;
            _loc3_ = int(this.scroll.value * (this.data.objects.length - this.§_-w1q§));
            if(_loc3_ != this.offset)
            {
               this.offset = _loc3_;
               this.scroll.§_-r1E§(_loc2_);
            }
         }
      }
      
      private function §_-11q§(param1:§_-gn§) : void
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
            case §_-gn§.§_-FM§:
               this.image = §_-RY§.§_-RE§(param1.id);
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
      
      private function §_-X1z§(param1:§_-h2m§) : void
      {
         this.select(param1.element as §_-gn§);
      }
      
      private function select(param1:§_-gn§) : void
      {
         if(this.§_-02G§ == param1)
         {
            return;
         }
         if(this.§_-02G§ != null)
         {
            this.§_-02G§.selected = false;
         }
         this.§_-02G§ = param1;
         if(this.§_-02G§ != null)
         {
            this.§_-02G§.selected = true;
         }
         this.§_-11q§(this.§_-02G§);
         this.§_-Ei§(this.§_-02G§ ? this.§_-02G§.id : 0);
      }
   }
}

