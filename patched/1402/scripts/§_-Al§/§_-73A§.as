package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-j1d§;
   import §_-E1v§.§_-y1B§;
   import §_-X1k§.§_-C2b§;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class §_-73A§
   {
      
      public var sprite:Sprite = new Sprite();
      
      private var §_-Y1S§:TextField = null;
      
      private var §_-T2t§:TextField = null;
      
      private var §_-uF§:CheckBox = null;
      
      private var §_-EC§:§_-y1B§ = null;
      
      private var §_-z2X§:Function = null;
      
      private var §_-U1l§:Function = null;
      
      public function §_-73A§(param1:Function, param2:Function)
      {
         super();
         this.§_-z2X§ = param1;
         this.§_-U1l§ = param2;
         this.build();
      }
      
      public function load(param1:int, param2:int, param3:Boolean) : void
      {
         this.§_-Y1S§.text = param1.toString();
         this.§_-T2t§.text = param2.toString();
         this.§_-uF§.selected = param3;
         this.§_-G1f§();
      }
      
      public function §_-x2R§() : Array
      {
         var _loc1_:int = int(this.§_-Y1S§.text);
         if(_loc1_ <= 0)
         {
            return null;
         }
         return [_loc1_,int(this.§_-T2t§.text),this.§_-uF§.selected ? 1 : 0];
      }
      
      public function §_-G1f§() : void
      {
         var _loc1_:int = int(this.§_-Y1S§.text);
         if(_loc1_ <= 0)
         {
            this.§_-EC§.text = "";
            return;
         }
         var _loc2_:int = this.§_-U1l§ != null ? int(this.§_-U1l§()) : 0;
         var _loc3_:String = _loc2_ > 0 ? §_-C2b§.§_-52F§(_loc2_,_loc1_) : "";
         this.§_-EC§.text = _loc3_ != "" ? _loc3_ : "Задание " + _loc1_;
      }
      
      public function dispose() : void
      {
         if(this.sprite.parent)
         {
            this.sprite.parent.removeChild(this.sprite);
         }
         this.§_-Y1S§.removeEventListener(Event.CHANGE,this.§_-9§);
         this.§_-T2t§.removeEventListener(Event.CHANGE,this.§_-9§);
         this.§_-uF§.removeEventListener(Event.CHANGE,this.§_-9§);
      }
      
      private function build() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Sprite = this.§_-e2B§("ID",40,_loc1_,_loc2_);
         this.§_-Y1S§ = _loc3_.getChildAt(1) as TextField;
         this.§_-Y1S§.addEventListener(Event.CHANGE,this.§_-9§);
         _loc1_ = int(_loc3_.x + _loc3_.width + 8);
         var _loc4_:Sprite = this.§_-e2B§("Счёт",50,_loc1_,_loc2_);
         this.§_-T2t§ = _loc4_.getChildAt(1) as TextField;
         this.§_-T2t§.addEventListener(Event.CHANGE,this.§_-9§);
         _loc1_ = int(_loc4_.x + _loc4_.width + 8);
         this.§_-uF§ = new CheckBox();
         this.§_-uF§.label = "Выдано";
         this.§_-uF§.x = _loc1_;
         this.§_-uF§.y = _loc2_ + 2;
         this.§_-uF§.addEventListener(Event.CHANGE,this.§_-9§);
         this.sprite.addChild(this.§_-uF§);
         this.§_-EC§ = new §_-y1B§("",0,_loc2_ + 22,§_-A3G§.§_-v1I§);
         this.§_-EC§.width = 430;
         this.sprite.addChild(this.§_-EC§);
      }
      
      private function §_-e2B§(param1:String, param2:int, param3:int, param4:int) : Sprite
      {
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(new §_-y1B§(param1,0,0,§_-A3G§.§_-v1I§));
         var _loc6_:TextField = new TextField();
         _loc6_.selectable = true;
         _loc6_.mouseEnabled = true;
         §_-j1d§.§_-43I§(_loc6_,_loc5_,int(_loc5_.width) + 2,0,param2,18,100,true);
         _loc5_.x = param3;
         _loc5_.y = param4;
         this.sprite.addChild(_loc5_);
         return _loc5_;
      }
      
      private function §_-9§(param1:Event) : void
      {
         if(param1.currentTarget == this.§_-Y1S§)
         {
            this.§_-G1f§();
         }
         if(this.§_-z2X§ != null)
         {
            this.§_-z2X§();
         }
      }
   }
}

