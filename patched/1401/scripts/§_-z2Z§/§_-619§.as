package §_-z2Z§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-d10§.§_-s2E§;
   import events.GameEvent;
   import flash.text.TextFormat;
   import tape.§_-A3s§;
   import views.§_-W1y§;
   
   public class §_-619§ extends §_-A3s§
   {
      
      private static const §_-r2u§:int = 95;
      
      private static const §_-R1K§:int = 100;
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,10,6697728,true,null,null,null,null,"center");
      
      protected var icon:§_-W1y§;
      
      protected var §_-21J§:§_-s2E§ = null;
      
      protected var §_-o2k§:Boolean = false;
      
      public function §_-619§(param1:int)
      {
         super(param1);
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-A3c§);
         §_-h1f§.addEventListener(GameEvent.CLOTHES_HERO_CHANGE,this.§_-A3c§);
      }
      
      public function set §_-41w§(param1:Boolean) : void
      {
         if(this.§_-o2k§ == param1)
         {
            return;
         }
         this.§_-o2k§ = param1;
         if(!this.§_-21J§)
         {
            return;
         }
         if(!param1)
         {
            addChild(this.§_-21J§);
         }
         else if(contains(this.§_-21J§))
         {
            removeChild(this.§_-21J§);
         }
      }
      
      public function get §_-41w§() : Boolean
      {
         return this.§_-o2k§;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Nh§ = new ElementPackageBackSelectedGreen();
         this.§_-Nh§.width = §_-r2u§;
         this.§_-Nh§.height = §_-R1K§;
         this.§_-Nh§.visible = false;
         addChild(this.§_-Nh§);
         this.back = new ElementPackageBack();
         this.back.width = §_-r2u§;
         this.back.height = §_-R1K§;
         addChild(this.back);
         this.icon = new §_-W1y§(this.§_-qW§);
         this.icon.scaleX = this.icon.scaleY = 0.3;
         this.icon.x = (§_-r2u§ - this.icon.width) * 0.5;
         this.icon.y = §_-R1K§ - this.icon.height - 12;
         addChild(this.icon);
         var _loc1_:§_-22V§ = new §_-22V§(§_-g2W§.§_-G1Y§(this.§_-qW§),0,3,§_-i2c§);
         _loc1_.width = §_-r2u§;
         _loc1_.wordWrap = true;
         addChild(_loc1_);
         this.§_-A3c§();
      }
      
      protected function get §_-qW§() : int
      {
         if(§_-g2W§.§_-Kg§(this.id))
         {
            return this.id;
         }
         return §_-g2W§.§_-W2m§(this.id)[0];
      }
      
      private function §_-A3c§(param1:GameEvent = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(§_-g2W§.§_-Kg§(this.id))
         {
            _loc2_ = §_-h1f§.§_-Y2o§(§_-g2W§.§_-43l§(this.id)) == -1;
         }
         else
         {
            _loc4_ = §_-g2W§.§_-W2m§(this.id);
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc2_ ||= §_-h1f§.§_-vQ§(_loc4_[_loc5_]);
               _loc5_++;
            }
            _loc3_ = !§_-h1f§.§_-x1C§(this.§_-qW§);
         }
         if(this.§_-21J§)
         {
            this.§_-21J§.visible = _loc3_ || _loc2_;
            this.§_-21J§.type = _loc3_ ? §_-s2E§.§_-71a§ : §_-s2E§.§_-42M§;
         }
         else
         {
            if(!_loc3_ && !_loc2_)
            {
               return;
            }
            this.§_-21J§ = new §_-s2E§(_loc3_ ? §_-s2E§.§_-71a§ : §_-s2E§.§_-42M§);
            this.§_-21J§.scaleX = this.§_-21J§.scaleY = 0.75;
            this.§_-21J§.x = 7;
            this.§_-21J§.y = 87;
            if(!this.§_-41w§)
            {
               addChild(this.§_-21J§);
            }
         }
      }
   }
}

