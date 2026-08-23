package §_-o10§
{
   public class §_-88§ extends §_-Vd§
   {
      
      private static const §_-G2A§:Object = {
         "free":[5,4,3],
         "paid":[2,1,1]
      };
      
      private var §_-i2I§:Number;
      
      public function §_-88§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-Yx§;
         this.§_-i2I§ = this.§_-bx§();
      }
      
      override protected function §_-bx§() : Number
      {
         var _loc1_:Number = Number(§_-G2A§["free"][0]);
         if(this.§_-f1V§ != 0)
         {
            _loc1_ = Math.min(§_-G2A§["free"][this.§_-f1V§ - 1],_loc1_);
         }
         if(this.§_-41Z§ != 0)
         {
            _loc1_ = Math.min(§_-G2A§["paid"][this.§_-f1V§ - 1],_loc1_);
         }
         return _loc1_;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero)
         {
            return;
         }
         this.hero.§_-F1u§.push(this.§_-i2I§);
         if(this.§_-53U§)
         {
            ++this.hero.§_-A2I§;
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         var _loc1_:int = this.hero.§_-F1u§.indexOf(this.§_-i2I§);
         if(_loc1_ != -1)
         {
            this.hero.§_-F1u§.splice(_loc1_,1);
         }
         if(this.§_-53U§)
         {
            --this.hero.§_-A2I§;
         }
      }
   }
}

