package §_-p1f§
{
   import §_-I10§.§_-a1D§;
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-43M§;
   import §_-l26§.§_-i1J§;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class §_-Q2j§
   {
      
      public var sprite:Sprite = new Sprite();
      
      private var §_-O1H§:TextField = null;
      
      private var §_-51D§:TextField = null;
      
      private var §_-X1r§:CheckBox = null;
      
      private var §_-V2v§:§_-i1J§ = null;
      
      private var §_-43b§:Function = null;
      
      private var §_-9Y§:Function = null;
      
      public function §_-Q2j§(param1:Function, param2:Function)
      {
         super();
         this.§_-43b§ = param1;
         this.§_-9Y§ = param2;
         this.build();
      }
      
      public function load(param1:int, param2:int, param3:Boolean) : void
      {
         this.§_-O1H§.text = param1.toString();
         this.§_-51D§.text = param2.toString();
         this.§_-X1r§.selected = param3;
         this.§_-93F§();
      }
      
      public function §_-k2K§() : Array
      {
         var _loc1_:int = int(this.§_-O1H§.text);
         if(_loc1_ <= 0)
         {
            return null;
         }
         return [_loc1_,int(this.§_-51D§.text),this.§_-X1r§.selected ? 1 : 0];
      }
      
      public function §_-93F§() : void
      {
         var _loc1_:int = int(this.§_-O1H§.text);
         if(_loc1_ <= 0)
         {
            this.§_-V2v§.text = "";
            return;
         }
         var _loc2_:int = this.§_-9Y§ != null ? int(this.§_-9Y§()) : 0;
         var _loc3_:String = _loc2_ > 0 ? §_-a1D§.§_-N2v§(_loc2_,_loc1_) : "";
         this.§_-V2v§.text = _loc3_ != "" ? _loc3_ : "Задание " + _loc1_;
      }
      
      public function dispose() : void
      {
         if(this.sprite.parent)
         {
            this.sprite.parent.removeChild(this.sprite);
         }
         this.§_-O1H§.removeEventListener(Event.CHANGE,this.§_-7r§);
         this.§_-51D§.removeEventListener(Event.CHANGE,this.§_-7r§);
         this.§_-X1r§.removeEventListener(Event.CHANGE,this.§_-7r§);
      }
      
      private function build() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Sprite = this.§_-V2W§("ID",40,_loc1_,_loc2_);
         this.§_-O1H§ = _loc3_.getChildAt(1) as TextField;
         this.§_-O1H§.addEventListener(Event.CHANGE,this.§_-7r§);
         _loc1_ = int(_loc3_.x + _loc3_.width + 8);
         var _loc4_:Sprite = this.§_-V2W§("Счёт",50,_loc1_,_loc2_);
         this.§_-51D§ = _loc4_.getChildAt(1) as TextField;
         this.§_-51D§.addEventListener(Event.CHANGE,this.§_-7r§);
         _loc1_ = int(_loc4_.x + _loc4_.width + 8);
         this.§_-X1r§ = new CheckBox();
         this.§_-X1r§.label = "Выдано";
         this.§_-X1r§.x = _loc1_;
         this.§_-X1r§.y = _loc2_ + 2;
         this.§_-X1r§.addEventListener(Event.CHANGE,this.§_-7r§);
         this.sprite.addChild(this.§_-X1r§);
         this.§_-V2v§ = new §_-i1J§("",0,_loc2_ + 22,§_-32A§.§_-53t§);
         this.§_-V2v§.width = 430;
         this.sprite.addChild(this.§_-V2v§);
      }
      
      private function §_-V2W§(param1:String, param2:int, param3:int, param4:int) : Sprite
      {
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(new §_-i1J§(param1,0,0,§_-32A§.§_-53t§));
         var _loc6_:TextField = new TextField();
         _loc6_.selectable = true;
         _loc6_.mouseEnabled = true;
         §_-43M§.§_-22h§(_loc6_,_loc5_,int(_loc5_.width) + 2,0,param2,18,100,true);
         _loc5_.x = param3;
         _loc5_.y = param4;
         this.sprite.addChild(_loc5_);
         return _loc5_;
      }
      
      private function §_-7r§(param1:Event) : void
      {
         if(param1.currentTarget == this.§_-O1H§)
         {
            this.§_-93F§();
         }
         if(this.§_-43b§ != null)
         {
            this.§_-43b§();
         }
      }
   }
}

